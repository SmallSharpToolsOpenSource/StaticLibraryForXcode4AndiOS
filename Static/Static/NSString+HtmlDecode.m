//
//  NSString+HtmlDecode.m
//  Primary
//
//  Created by Brennan Stehling on 10/14/11.
//  Copyright (c) 2011 Marquette University. All rights reserved.
//

#import "NSString+HtmlDecode.h"

#import "MREntitiesConverter.h"

@implementation NSString (HtmlDecode)

- (NSString *)htmlDecode {
    MREntitiesConverter *converter = [[MREntitiesConverter alloc] init];
    NSString *decoded = [converter convertEntiesInString:self];
    [converter release];
    
    return decoded;
}

@end
