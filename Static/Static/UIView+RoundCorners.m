//
//  UIView+RoundCorners.m
//  Primary
//
//  Created by Brennan Stehling on 8/5/11.
//  Copyright 2011 Marquette University. All rights reserved.
//

#import "UIView+RoundCorners.h"

#import <QuartzCore/QuartzCore.h>

@implementation UIView (UIView_RoundCorners)

- (void)roundCorners:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius {
    [[self layer] setBorderColor:[borderColor CGColor]];
    [[self layer] setBorderWidth:borderWidth];
    [[self layer] setCornerRadius:cornerRadius];
    [self setClipsToBounds: YES];
}

@end
