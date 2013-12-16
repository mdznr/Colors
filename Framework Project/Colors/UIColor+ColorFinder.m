//
//  UIColor+ColorFinder.m
//  Colors
//
//  Created by Matt on 10/29/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "UIColor+ColorFinder.h"
#import "UIColor+Manipulation.h"

@implementation UIColor (ColorFinder)

- (UIColor *)mostSimilarColorInSet:(NSSet *)colors
{
	UIColor *closestColor = nil;
	CGFloat closestDifference = CGFLOAT_MAX;
	for ( UIColor *color in colors ) {
		CGFloat difference = [UIColor differenceBetweenColor:self andColor:color];
		if ( difference < closestDifference ) {
			closestDifference = difference;
			closestColor = color;
		}
	}
	return  closestColor;
}

@end
