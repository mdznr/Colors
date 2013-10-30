//
//  UIColor+Manipulation.h
//  Colors
//
//  Created by Matt Zanchelli on 9/24/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import UIKit;

@interface UIColor (Manipulation)

/// The perceived difference between two colors.
/// Calculated using the CIEDE2000 Color-Difference Formula.
+ (double)differenceBetweenColor:(UIColor *)color1 andColor:(UIColor *)color2;

@end
