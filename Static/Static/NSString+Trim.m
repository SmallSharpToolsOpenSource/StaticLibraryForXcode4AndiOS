//
//  NSString+Trim.m
//  Primary
//
//  Created by Brennan Stehling on 11/19/11.
//  Copyright (c) 2011 Marquette University. All rights reserved.
//

#import "NSString+Trim.h"

#import "math.h"

@implementation NSString (Trim)

- (NSString *)leftTrim {
    if ([self length] > 0) {
        NSUInteger i = 0;
        NSCharacterSet *charset = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        while ([charset characterIsMember:[self characterAtIndex:i]] && i < self.length) {
            i++;
        }
        return [self substringFromIndex:i];
    }
    else {
        return @"";
    }
}

- (NSString *)rightTrim {
    if ([self length] > 0) {
        NSUInteger i = self.length - 1;
        NSCharacterSet *charset = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        while ([charset characterIsMember:[self characterAtIndex:i]] && i > 0) {
            i--;
        }
        
        return [self substringToIndex:i+1];
    }
    else {
        return @"";
    }
}

- (NSString *)trim {
    return [[self leftTrim] rightTrim];
}

//assert([[@"test" trim] isEqualToString:@"test"]);
//assert([[@"test  " trim] isEqualToString:@"test"]);
//assert([[@"  test  " leftTrim] isEqualToString:@"test  "]);
//assert([[@"  test  " rightTrim] isEqualToString:@"  test"]);

@end
