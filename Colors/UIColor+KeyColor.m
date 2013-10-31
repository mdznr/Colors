//
//  UIColor+KeyColor.m
//  Colors
//
//  Created by Matt on 10/30/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "UIColor+KeyColor.h"
#import "UIColor+Components.h"

@implementation UIColor (KeyColor)

- (BOOL)isKeyColorAppropriate
{
#warning TODO: Use CIE-LAB to determine if appropriate.
	// TODO: Use some kind of addition or multiplication of a and b components of LAB.
	return [self brightness] + ((5.0f/7.0f)*[self saturation]) <= (17.0f/14.0f);
}

- (CGFloat)keyColorValue
{
#warning TODO: Implement. Find the shortest distance to the nearest key color appropriate color.
#warning What's the value if it is already key color appropriate?
	if ( [self isKeyColorAppropriate] ) {
		// Find smallest distance to a center of the key colors
	} else {
		// Find smallest distance to the key colors
	}
	return 0.0f;
}

/// Find the most appropriate color in the set to be used as a key color.
/// @param colors A set of colors of possible colors.
/// @return The color in the array that is most key color appropriate. Returns nil if no color is key color appropriate.
#warning Decision: Should this be a set or an array (like the other method). A set is more appropriate, but may be unexpected
#warning Decision: Should this even be a method?
+ (UIColor *)mostKeyColorAppropriate:(NSSet *)colors
{
	UIColor *mostKeyColorColor = nil;
	CGFloat mostKeyColorValue = 0.0f;
	for ( UIColor *color in colors ) {
		CGFloat keyColorValue = [color keyColorValue];
		if ( keyColorValue > mostKeyColorValue ) {
			mostKeyColorValue = keyColorValue;
			mostKeyColorColor = color;
		}
	}
	return mostKeyColorColor;
}

+ (UIColor *)firstKeyColor:(NSArray *)colors
{
	for ( UIColor *color in colors ) {
		if ( [color isKeyColorAppropriate] ) {
			return color;
		}
	}
	return nil;
}

@end
