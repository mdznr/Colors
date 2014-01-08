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
	// TODO:
	// Hue to minimum saturation and brightness equations below using CIE-LAB
	// Should take Helmholtz–Kohlrausch effect into account.
	// http://www.mikewoodconsulting.com/articles/Protocol%20Summer%202012%20-%20HK%20Effect.pdf
	
	CGFloat hue = self.hue * 360;
	
	// Mapping hue to minimum saturation requirement
	CGFloat minSaturation = (21.77 + 6.858 * cos(0.7304 - 0.03361 * hue) - cos(-0.02785 * hue) * cos(5.38 - 0.04656 * hue) * sqrt(21.77 + 6.858 * cos(0.7304 - 0.03361 * hue)) - 2.305 * cos(-0.05006 * hue))/100;
	
	// Mapping hue to minimum brightness requirement
	CGFloat minBrightness = (90.314602274097 + 4.67106830607091 * cos(5.76053102394881 + 0.0549832737885713 * hue) + 6.99308090421188 * atan2(0.078947879341588 * hue - 14.1391414696216, 3.78161629440642) * acosh(84.9134634977372 + sqrt(hue) * cos(5.76053102394881 + 0.0549832737885713 * hue)) - 0.259701255079698 * hue)/100;
	
	// Using ellipse equation centered around (1,1) to find acceptable values
	// Equation using bottom half of ellipse, the left side being the important side.
	// Original equation: ((x-1)^2)/((1-minSaturation)^2) + ((y-1)^2)/((1-minBrightness)^2) = 1
	
	CGFloat a = pow(self.saturation-1, 2);
	CGFloat b = pow(1-minSaturation, 2);
	CGFloat c = pow(1-minBrightness, 2);
	return self.brightness >= 1 - sqrt(c-((c*a)/b));	
}

/// The distance from the receiver to the set of acceptable key colors
/// @return The distance (perceived difference) from the receiver to the set of acceptable key colors
- (CGFloat)keyColorValue
{
	// TODO: Implement.
	// TODO: Find the shortest distance to the nearest key color appropriate color.
	// TODO: What's the value if it is already an appropriate key color?
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
// TODO: Decision: Should this be a set or an array (like the other method)? A set is more appropriate, but may be unexpected
// TODO: Decision: Should this even be a method?
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
