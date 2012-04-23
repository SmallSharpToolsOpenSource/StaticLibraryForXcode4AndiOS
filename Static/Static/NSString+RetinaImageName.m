//
//  NSString+RetinaImageName.m
//  Primary
//
//  Created by Brennan Stehling on 10/26/11.
//  Copyright (c) 2011 Marquette University. All rights reserved.
//

#import "NSString+RetinaImageName.h"

#import "UIDevice+Hardware.h"

@implementation NSString (RetinaImageName)

- (NSString *)retinaImageName {
    // only change for retina display and PNG images
    if ([[UIDevice currentDevice] isRetinaDisplay]) {
        NSString *extension = @".png";
        if ([self rangeOfString:@".jpg"].location != NSNotFound) {
            extension = @".jpg";
        }
        else if ([self rangeOfString:@".gif"].location != NSNotFound) {
            extension = @".gif";
        }
        
        NSRange range = [self rangeOfString:extension options:NSCaseInsensitiveSearch];
        if (range.location != NSNotFound) {
            NSString *replacement = [NSString stringWithFormat:@"@2x%@", extension];
            
            NSString *tmp = [NSString stringWithFormat:@"%@%@", [self substringToIndex:range.location], replacement];
            return tmp;
        }
    }
    
    return self;
}

@end
