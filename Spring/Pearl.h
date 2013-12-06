//
//  Pearl.h
//  Spring
//
//  Created by Dimitri Vishnepolsky on 12/5/13.
//  Copyright (c) 2013 dImo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Pearl: UIView {
	CGPoint location;
	CGPoint velocity;
    UIColor *color;
}

- (id) initWithLocation: (CGPoint) p color: (UIColor *) c;
- (void) drag: (CGPoint) p;

@property (assign, nonatomic) CGPoint location;
@end
