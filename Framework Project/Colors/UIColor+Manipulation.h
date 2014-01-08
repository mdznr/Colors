//
//  UIColor+Manipulation.h
//  Colors
//
//  Created by Matt Zanchelli on 9/24/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import UIKit;

@interface UIColor (Manipulation)

// TODO:
// Add methods to lighten/darken, and adjust saturation of colors.

/*
 Find the perceived difference in two colors. It uses the CIEDE2000 Color-Difference Formula.
 */

/// The perceived difference between two colors.
/// Calculated using the CIEDE2000 Color-Difference Formula.
/// @param color1 The first of the two colors to compare.
/// @param color2 The second of the two colors to compare.
/// @return A floating point number representing the difference between the two colors.
+ (CGFloat)differenceBetweenColor:(UIColor *)color1 andColor:(UIColor *)color2;

@end
