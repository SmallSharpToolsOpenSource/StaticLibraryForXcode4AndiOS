/*
 //  MREntitiesConverter.m
 //  Primary
 //
 //  Via StackOverflow.com: 
 //  http://stackoverflow.com/questions/659602/objective-c-html-escape-unescape
 //
 //  Created by Brennan Stehling on 8/5/11.
 //  Copyright 2011 Marquette University. All rights reserved.
 */

#import "MREntitiesConverter.h"

@implementation MREntitiesConverter

@synthesize resultString;

- (id)init {
	self = [super init];
    if (self) {
        resultString = [[NSMutableString alloc] init];
    }
	return self;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)s {
	[self.resultString appendString:s];
}

- (NSString*)convertEntiesInString:(NSString*)s {
    if(s == nil) {
        NSLog(@"ERROR : Parameter string is nil");
    }
    NSString* xmlStr = [NSString stringWithFormat:@"<d>%@</d>", s];
    NSData *data = [xmlStr dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSXMLParser* xmlParse = [[NSXMLParser alloc] initWithData:data];
    [xmlParse setDelegate:self];
    [xmlParse parse];
    NSString* returnStr = [NSString stringWithFormat:@"%@", resultString];
    return returnStr;
}

- (void)dealloc {
    [resultString release];
    [super dealloc];
}

@end
