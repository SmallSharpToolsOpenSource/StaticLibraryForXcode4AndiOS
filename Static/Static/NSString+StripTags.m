//
//  NSString+StripTags.m
//  Primary
//
//  Created by Brennan Stehling on 8/11/11.
//  Copyright 2011 Marquette University. All rights reserved.
//

#import "NSString+StripTags.h"

@implementation NSString (StripTags)

- (NSString *)stripTags {
    NSMutableString *ms = [NSMutableString stringWithCapacity:[self length]];
    
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner setCharactersToBeSkipped:nil];
    NSString *s = nil;
    while (![scanner isAtEnd]) {
        [scanner scanUpToString:@"<" intoString:&s];
        if (s != nil) {
            [ms appendString:s];
        }
        [scanner scanUpToString:@">" intoString:NULL];
        if (![scanner isAtEnd]) {
            [scanner setScanLocation:[scanner scanLocation]+1];
        }
        s = nil;
    }
    
    return ms;
}

@end
