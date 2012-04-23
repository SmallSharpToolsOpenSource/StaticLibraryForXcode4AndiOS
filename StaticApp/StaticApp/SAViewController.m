//
//  SAViewController.m
//  StaticApp
//
//  Created by Brennan Stehling on 4/22/12.
//  Copyright (c) 2012 SmallSharpTools LLC. All rights reserved.
//

#import "SAViewController.h"

#import "Static.h"

@interface SAViewController ()

@property (retain, nonatomic) IBOutlet UIView *roundedView;

@end

@implementation SAViewController

@synthesize roundedView = _roundedView;

- (void)dealloc {
    [_roundedView release];
    
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self.roundedView roundCorners:[UIColor blackColor] borderWidth:3.0 cornerRadius:15.0];
}

- (void)viewDidUnload {
    [self setRoundedView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
