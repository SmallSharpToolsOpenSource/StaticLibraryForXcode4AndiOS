//
//  NSURL+CacheKey.m
//  Primary
//
//  Created by Brennan Stehling on 11/18/11.
//  Copyright (c) 2011 Marquette University. All rights reserved.
//

#import "NSURL+CacheKey.h"

@implementation NSURL (CacheKey)

- (NSString *)generatedCacheKey {
    NSMutableString *str = [NSMutableString stringWithString:self.absoluteString];
    
    [str replaceOccurrencesOfString:@"://" withString:@"-" options:NSLiteralSearch range:NSMakeRange(0, [str length])];
    [str replaceOccurrencesOfString:@"/" withString:@"-" options:NSLiteralSearch range:NSMakeRange(0, [str length])];
    
    return str;
}

@end
