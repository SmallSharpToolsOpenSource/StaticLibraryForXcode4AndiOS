//
//  NSDate+FormatUsingFormat.m
//  Primary
//
//  Created by Brennan Stehling on 10/30/11.
//  Copyright (c) 2011 Marquette University. All rights reserved.
//

#import "NSDate+FormatUsingFormat.h"

@implementation NSDate (FormatUsingFormat)

- (NSString *)formatUsingFormat:(NSString *)dateFormat {
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    [formatter setCalendar:cal];
    [formatter setLocale:[NSLocale currentLocale]];
    NSString *ret = [formatter stringFromDate:self];
    [formatter release];
    [cal release];
    return ret;
}

@end
