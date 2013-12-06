//
//  View.m
//  Spring
//
//  Created by Dimitri Vishnepolsky on 12/5/13.
//  Copyright (c) 2013 dImo. All rights reserved.
//

#import "View.h"
#import "Pearl.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];

		touchPoint = CGPointMake(
			self.bounds.size.width / 2,
			self.bounds.size.height / 2
		);

        //different colors of pieces of strings
		a = [NSArray arrayWithObjects:
             [[Pearl alloc] initWithLocation: touchPoint color: [UIColor blueColor]],
			[[Pearl alloc] initWithLocation: touchPoint color:[UIColor orangeColor]],
			[[Pearl alloc] initWithLocation: touchPoint color:[UIColor purpleColor]],
			[[Pearl alloc] initWithLocation: touchPoint color:[UIColor redColor]],
			[[Pearl alloc] initWithLocation: touchPoint color:[UIColor greenColor]],
			nil
		];
	}
	return self;
}

// The first Pearl hangs from the point where the finger touched.
// Each subsequent Pearl hangs from the center of the previous one.

- (void) drawRect: (CGRect) rect
{
	// Drawing code
	[[a objectAtIndex: 0] drag: touchPoint];

    
    //int randNum = rand() % ([1] - [0]) + [0];
    
    for (NSUInteger i = 1; i < a.count; ++i) {
		Pearl *pearl = [a objectAtIndex: i];
		Pearl *previousPearl = [a objectAtIndex: i - 1];
		[pearl drag: previousPearl.location];
	}
    

}

#pragma mark -
#pragma mark Class UIResponder

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	touchPoint = [[touches anyObject] locationInView: self];
}


- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	touchPoint = [[touches anyObject] locationInView: self];
}

@end
