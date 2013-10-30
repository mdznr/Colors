//
//  UIColor+colorFinder.m
//  Colors
//
//  Created by Matt on 10/29/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "UIColor+colorFinder.h"
#import "UIColor+Manipulation.h"

@implementation UIColor (colorFinder)

- (UIColor *)mostSimilarColorInSet:(NSSet *)colors
{
	UIColor *closestColor = nil;
	double closestDifference = FLT_MAX;
	for ( UIColor *color in colors ) {
		double difference = [UIColor differenceBetweenColor:self andColor:color];
		if ( difference < closestDifference ) {
			closestDifference = difference;
			closestColor = color;
		}
	}
	return  closestColor;
}

@end
