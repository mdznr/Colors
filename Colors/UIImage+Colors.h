//
//  UIImage+Colors.h
//  Colors
//
//  Created by Matt Zanchelli on 9/24/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Colors)

/// The color that appears to dominate the background of the image
/// @discussion Returns nil if no good color is found
- (UIColor *)backgroundColor;

/// The key color that appears to dominate the foreground of the image
/// @discussion Returns nil if no good color is found
- (UIColor *)foregroundColor;

/// The primary color that appears to dominate the image
/// @discussion Returns nil if no good color is found
- (UIColor *)keyColor;

/// The primary color that appears to dominate the image.
/// @param color Another color that the key color needs to contrast with
/// @param ratio From 0-1, the perceived difference in color difference.
/// @discussion Returns nil if no good color is found.
/// @discussion This method is more likely to return nil if the contrast is high.
/// @discussion Recommended contrast amounts: 0.1 is what most people would consider "different colors". 0.2 is a difference in dominant colors. 0.5 is generally suitable for all contrast needs.
- (UIColor *)keyColorToContrastAgainstColor:(UIColor *)color
							   withContrast:(CGFloat)contrast;

@end
