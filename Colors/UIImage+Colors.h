//
//  UIImage+Colors.h
//  Colors
//
//  Created by Matt Zanchelli on 9/24/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

#warning expose contrast in a few separate values? low medium and high?

typedef enum {
	UIColorContrastLevelLow,
	UIColorContrastLevelMedium,
	UIColorContrastLevelHigh,
} UIColorContrast;

@interface UIImage (Colors)

/// The color that appears to dominate the background of the image
/// @discussion Returns nil if no good color is found
- (UIColor *)backgroundColor;

#warning offer method without contrast?
/// The color that appears to dominate the background of the image
/// @param colors An array of colors that the returned color needs to contrast with
/// @param contrast The perceived difference in color difference.
/// @discussion Returns nil if no good color is found
- (UIColor *)backgroundColorToContrastAgainstColors:(NSArray *)colors
									   withContrast:(UIColorContrast)contrast;


/// The primary, bright and saturated color that appears to dominate the image
/// @discussion Returns nil if no good color is found
- (UIColor *)keyColor;

#warning offer method without contrast?
/// The primary saturated color that appears to dominate the image
/// @param color An array of colors that the returned color needs to contrast with
/// @param contrast The perceived difference in color difference.
/// @discussion Returns nil if no good color is found
- (UIColor *)keyColorToContrastAgainstColors:(NSArray *)colors
								withContrast:(UIColorContrast)contrast;

@end
