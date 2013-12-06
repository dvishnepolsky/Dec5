//
//  Pearl.m
//  Spring
//
//  Created by Dimitri Vishnepolsky on 12/5/13.
//  Copyright (c) 2013 dImo. All rights reserved.
//

#import "Pearl.h"

@implementation Pearl
@synthesize location;

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
	}
	return self;
}

- (id) initWithLocation: (CGPoint) p color: (UIColor *) c
{
	self = [super init];
	if (self) {
		location = p;
		velocity = CGPointZero;
        color = c;
	}
	return self;
}

//Drag the Pearl towards point p.

- (void) drag: (CGPoint) p {
	static const CGFloat stiffness = 0.2;	//elasticity
	static const CGFloat gravity = 3;
	static const CGFloat mass = 2;	//must be positive
	static const CGFloat damping = 0.7;
	static const CGFloat radius = 20;	//in pixels

	CGPoint force = CGPointMake(
		(p.x - location.x) * stiffness,
		(p.y - location.y) * stiffness + gravity * mass
	);

	//F = ma
	CGPoint acceleration = CGPointMake(
		force.x / mass,
		force.y / mass
	);

	velocity = CGPointMake(
		damping * (velocity.x + acceleration.x),
		damping * (velocity.y + acceleration.y)
	);

	location = CGPointMake(
		location.x + velocity.x,
		location.y + velocity.y
	);
				
	CGRect rect = CGRectMake(
		location.x - radius,
		location.y - radius,
		2 * radius,
		2 * radius
	);

	CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetShadow(c, CGSizeMake(20.0f, 5.0f), 10.0f); //draw shadow
    
    //experiment:----------------------------------------------
    CGContextSetFillColorWithColor(c, UIColor.blueColor.CGColor);
    // end experiment-------------------------------------------

	CGContextBeginPath(c);
    
	// draw circle:
    CGContextAddEllipseInRect(c, rect);
    
    
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
	CGContextSetRGBFillColor(c, red, green, blue, alpha);	//fill out pearl with a specific color
	CGContextFillPath(c);

	CGContextMoveToPoint(c, location.x, location.y);
	CGContextAddLineToPoint(c, p.x, p.y);
    
	CGContextSetRGBStrokeColor(c, 1, 1, 1, 1);
	CGContextStrokePath(c);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
	// Drawing code
}
*/

@end
