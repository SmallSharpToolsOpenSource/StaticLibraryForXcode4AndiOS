//
//  DataManager.h
//  Static
//
//  Created by Brennan Stehling on 4/22/12.
//  Copyright (c) 2012 SmallSharpTools LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Singleton.h"

@interface DataManager : NSObject

SYNTHESIZE_SINGLETON_FOR_HEADER(DataManager);

- (void)didStartNetworking;
- (void)didStopNetworking;

@end
