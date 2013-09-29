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

/*
+ (CGFloat)euclideanDistanceFromColor:(UIColor *)color
							  toColor:(UIColor *)anotherColor
{
	CGFloat y1 = color.yValue;
	CGFloat y2 = anotherColor.yValue;
	
	CGFloat u1 = color.uValue;
	CGFloat u2 = anotherColor.uValue;
	
	CGFloat v1 = color.vValue;
	CGFloat v2 = anotherColor.vValue;
	
	CGFloat distance = sqrtf(SQUARED(y1-y2) + SQUARED(u1-u2) + SQUARED(v1-v2));
	
	return distance;
}
*/

+ (CGFloat)euclideanDistanceFromColor:(UIColor *)color
							  toColor:(UIColor *)anotherColor
{
	CGFloat l1 = color.lValue;
	CGFloat l2 = anotherColor.lValue;
	
	CGFloat a1 = color.aValue;
	CGFloat a2 = anotherColor.aValue;
	
	CGFloat b1 = color.aValue;
	CGFloat b2 = anotherColor.bValue;
	
	CGFloat distance = sqrtf(SQUARED(l1-l2) + SQUARED(a1-a2) + SQUARED(b1-b2));
	
	return distance;
}

@end
