//
//  NSString+URLEncode.m
//  Primary
//
//  Created by Brennan Stehling on 8/5/11.
//  Copyright 2011 Marquette University. All rights reserved.
//

#import "NSString+URLEncode.h"

@implementation NSString (NSString_URLEncode)

- (NSString *)urlEncodedString {
    CFStringRef ref = CFURLCreateStringByAddingPercentEscapes( NULL, 
                                                              (CFStringRef)self, 
                                                              NULL, 
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]", 
                                                              kCFStringEncodingUTF8 );  
    
    NSString * encoded = [NSString stringWithString: (NSString *)ref];
    
    CFRelease( ref );
    
    return encoded;
}

@end
