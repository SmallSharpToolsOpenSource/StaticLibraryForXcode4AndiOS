//
//  DataDownloader.h
//  Static
//
//  Created by Brennan Stehling on 4/22/12.
//  Copyright (c) 2012 SmallSharpTools LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^DataDownloadCompletionHandler)(NSData *data, NSError *error);

@interface DataDownloader : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, copy) DataDownloadCompletionHandler completionHandler;

- (void)startDownload:(NSURL *)theURL;

@end
