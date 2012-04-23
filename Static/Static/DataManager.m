//
//  DataManager.m
//  Static
//
//  Created by Brennan Stehling on 4/22/12.
//  Copyright (c) 2012 SmallSharpTools LLC. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager {
    NSUInteger networkingCount;
}

#pragma mark - Singleton
#pragma mark -

SYNTHESIZE_SINGLETON_FOR_CLASS(DataManager);

- (void)didStartNetworking {
    networkingCount += 1;
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)didStopNetworking {
    if (networkingCount > 0) {
        networkingCount -= 1;
    }
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: (networkingCount > 0)];
}

@end
