//
//  DataDownloader.m
//  Static
//
//  Created by Brennan Stehling on 4/22/12.
//  Copyright (c) 2012 SmallSharpTools LLC. All rights reserved.
//

#import "DataDownloader.h"

#import "DataManager.h"

@interface DataDownloader ()

@property (nonatomic, retain) NSURLConnection *connection;
@property (nonatomic, retain) NSMutableData *receivedData;

@end

@implementation DataDownloader

@synthesize completionHandler;

@synthesize connection;
@synthesize receivedData;

- (void)dealloc {
    [completionHandler release];
    [receivedData release];
    
    [super dealloc];
}

//- (id)init {
//    self = [super init];
//    if (self) {
//    }
//    return self;
//}

- (void)startDownload:(NSURL *)theURL {
    //    NSURLRequest *theRequest = [NSURLRequest requestWithURL:theURL
    //                                                cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
    //                                            timeoutInterval:60];
    
    
    // use the default cache policy to do the memory/disk caching
    NSMutableURLRequest *theRequest = [NSMutableURLRequest 
                                       requestWithURL:theURL 
                                       cachePolicy:NSURLRequestUseProtocolCachePolicy 
                                       timeoutInterval:15];
    
    // ensure a fresh response is returned
    [theRequest setValue:@"Cache-Control" forHTTPHeaderField:@"no-cache"];
    
    self.connection = [NSURLConnection connectionWithRequest:theRequest delegate:self];
    
    if (self.connection == nil) {
        /* inform the user that the connection failed */
        
        NSString *errorMessage = [NSString stringWithFormat:@"Error creating connection (%@)", theURL];
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:errorMessage forKey:NSLocalizedDescriptionKey];
        NSError *error = [NSError errorWithDomain:@"DataDownloadErorDomain"
                                             code:100
                                         userInfo:userInfo];
        self.completionHandler(nil, error);
        return;
    }
    
    [[DataManager sharedInstance] didStartNetworking];
}

- (void)cancelDownload {
    [self.connection cancel];
    [[DataManager sharedInstance] didStopNetworking];
}

#pragma mark - NSURLConnectionDataDelegate
#pragma mark -

- (void)connection:(NSURLConnection *)theConnection didReceiveResponse:(NSURLResponse *)response {
	/* create the NSMutableData instance that will hold the received data */
    
    if([response isKindOfClass:[NSHTTPURLResponse class]]) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode != 200) {
            
            NSString *errorMessage = [NSString stringWithFormat:@"Error while downloading: %i", httpResponse.statusCode];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:errorMessage forKey:NSLocalizedDescriptionKey];
            NSError *error = [NSError errorWithDomain:@"DataDownloadErorDomain"
                                                 code:httpResponse.statusCode
                                             userInfo:userInfo];
            self.completionHandler(nil, error);
            [self cancelDownload];
            return;
        }
    }
    
	long long contentLength = [response expectedContentLength];
	if (contentLength == NSURLResponseUnknownLength) {
		contentLength = 500000;
	}
	self.receivedData = [NSMutableData dataWithCapacity:(NSUInteger)contentLength];
}

- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)data {
    /* Append the new data to the received data. */
    [self.receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)theConnection didFailWithError:(NSError *)error {
    [[DataManager sharedInstance] didStopNetworking];
    self.completionHandler(nil, error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)theConnection {
    [[DataManager sharedInstance] didStopNetworking];
    self.completionHandler(self.receivedData, nil);
}

@end
