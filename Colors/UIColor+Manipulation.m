//
//  UIColor+Manipulation.m
//  Colors
//
//  Created by Matt Zanchelli on 9/24/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "UIColor+Manipulation.h"
#import "UIColor+Components.h"

#define SQUARED(X) ((X)*(X))

@implementation UIColor (Manipulation)

+ (CGFloat)euclideanDistanceFromColor:(UIColor *)color toColor:(UIColor *)anotherColor
{
	CGFloat y1 = color.yValue;
	CGFloat y2 = anotherColor.yValue;
	
	CGFloat u1 = color.uValue;
	CGFloat u2 = anotherColor.uValue;
	
	CGFloat v1 = color.vValue;
	CGFloat v2 = anotherColor.vValue;
	
	CGFloat distance = sqrtl(SQUARED(y1-y2) + SQUARED(u1-u2) + SQUARED(v1-v2));
	
	return distance;
}

@end
