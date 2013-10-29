//
//  UIImage+Colors.h
//  Colors
//
//  Created by Matt Zanchelli on 9/24/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import UIKit;

typedef enum {
	UIColorContrastLevelLow,    // JND (Just noticeable difference). Value determined by Mahy et al. (1994)
	UIColorContrastLevelMedium, // Two times JND
	UIColorContrastLevelHigh,	// Four times JND
} UIColorContrast;

@interface UIImage (Colors)

/// The color that appears to dominate the background of the image
/// @discussion Returns nil if no good color is found
- (UIColor *)backgroundColor;

/// The color that appears to dominate the background of the image
/// @param colors An array of colors that the returned color needs to contrast with
/// @param contrast The perceived difference in color difference.
/// @discussion Returns nil if no good color is found
- (UIColor *)backgroundColorToContrastAgainstColors:(NSArray *)colors
									   withContrast:(UIColorContrast)contrast;


/// The primary, bright and saturated color that appears to dominate the image
/// @discussion Returns nil if no good color is found
- (UIColor *)keyColor;

/// The primary saturated color that appears to dominate the image
/// @param color An array of colors that the returned color needs to contrast with
/// @param contrast The perceived difference in color difference.
/// @discussion Returns nil if no good color is found
- (UIColor *)keyColorToContrastAgainstColors:(NSArray *)colors
								withContrast:(UIColorContrast)contrast;

@end
