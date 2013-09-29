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

+ (float)euclideanDistanceFromColor:(UIColor *)color
							toColor:(UIColor *)anotherColor
{
	float y1 = color.yValue;
	float y2 = anotherColor.yValue;
	
	float u1 = color.uValue;
	float u2 = anotherColor.uValue;
	
	float v1 = color.vValue;
	float v2 = anotherColor.vValue;
	
	float distance = sqrtf(SQUARED(y1-y2) + SQUARED(u1-u2) + SQUARED(v1-v2));
	
	return distance;
}

@end
