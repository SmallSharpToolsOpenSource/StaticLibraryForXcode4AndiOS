//
//  SAAppDelegate.h
//  StaticApp
//
//  Created by Brennan Stehling on 4/22/12.
//  Copyright (c) 2012 SmallSharpTools LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SAViewController;

@interface SAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SAViewController *viewController;

@end
