//
//  ViewController.m
//  Spring
//
//  Created by Dimitri Vishnepolsky on 12/5/13.
//  Copyright (c) 2013 dImo. All rights reserved.
//

#import "ViewController.h"
#import "view.h"

@interface ViewController ()

@end

@implementation ViewController

/*
- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil
{
	self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}
*/

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView
{
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[View alloc] initWithFrame: frame];
}

- (void) viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	displayLink = [CADisplayLink displayLinkWithTarget: self.view
		selector: @selector(setNeedsDisplay)];

	displayLink.frameInterval = 1;

	NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
	[displayLink addToRunLoop: runLoop forMode: NSDefaultRunLoopMode];
}

- (UIStatusBarStyle) preferredStatusBarStyle {
	return UIStatusBarStyleLightContent;
}

- (NSUInteger) supportedInterfaceOrientations {
	return UIInterfaceOrientationMaskAll;
}

- (void) didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
