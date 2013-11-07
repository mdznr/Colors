//
//  UIImage+Colors.h
//  Colors
//
//  Created by Matt Zanchelli on 9/24/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import UIKit;

#ifndef NS_ENUM
#define NS_ENUM(_type, _name) enum _name : _type _name; enum _name : _type
#endif

/// Describes the level of contrast (perceived difference) between colors.
typedef NS_ENUM(NSInteger, UIColorContrast) {
	UIColorContrastLevelLow,    /// Describes a low level of contrast.
	UIColorContrastLevelMedium, /// Describes a medium level of contrast.
	UIColorContrastLevelHigh,   /// Describes a high level of contrast.
} NS_ENUM_AVAILABLE_IOS(5_0);

@interface UIImage (Colors)

#pragma mark - Background Color

/// The color that appears to dominate the background of the image.
/// @discussion Returns nil if no color is found.
- (UIColor *)backgroundColor NS_AVAILABLE_IOS(5_0);

/// The color that appears to dominate the background of the image.
/// @param colors An array of colors that the returned color needs to contrast with.
/// @param contrast The perceived difference in color difference.
/// @discussion Returns nil if no sufficient color is found.
- (UIColor *)backgroundColorToContrastAgainstColors:(NSArray *)colors withMinimumContrast:(UIColorContrast)minimumContrast NS_AVAILABLE_IOS(5_0);


#pragma mark - Key Color

/// The primary, bright and saturated color that appears to dominate the image.
/// @discussion Returns nil if no key-color acceptable color is found.
- (UIColor *)keyColor NS_AVAILABLE_IOS(5_0);

/// The primary saturated color that appears to dominate the image.
/// @param color An array of colors that the returned color needs to contrast with.
/// @param contrast The perceived difference in color difference.
/// @discussion Returns nil if no sufficient key-color acceptable color is found.
- (UIColor *)keyColorToContrastAgainstColors:(NSArray *)colors withMinimumContrast:(UIColorContrast)minimumContrast NS_AVAILABLE_IOS(5_0);

@end
