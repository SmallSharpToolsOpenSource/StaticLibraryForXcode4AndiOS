//
//  UIView+RoundCorners.m
//
//  Created by Brennan Stehling on 4/22/12.
//  Copyright (c) 2012 SmallSharpTools LLC. All rights reserved.
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
