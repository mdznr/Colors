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
	/// Describes a low level of contrast.
	UIColorContrastLevelLow,
	/// Describes a medium level of contrast.
	UIColorContrastLevelMedium,
	/// Describes a high level of contrast.
	UIColorContrastLevelHigh,
} NS_ENUM_AVAILABLE_IOS(5_0);


@interface UIImage (Colors)

/*
 Includes methods for getting colors from images. You can specify that you want a general-purpose color or a color to be used as a key color. You can specify if you want to guarantee a specified minimum contrast against another color, which is useful when displaying another color (in button text, for example) against a background color.
 */

#pragma mark - Background Color

/// The color that appears to dominate the background of the receiving image.
/// @return A @cUIImage object for the color that appears to dominate the background of the receiving image.
/// @warning Returns nil if no color is found.
- (UIColor *)backgroundColor NS_AVAILABLE_IOS(5_0);

/// The color that appears to dominate the background of the receiving image.
/// @param colors An array of colors that the returned color needs to contrast with.
/// @param contrast The perceived difference in color difference.
/// @return A @cUIImage object for the color that appears to dominate the background of the receiving image.
/// @warning Returns nil if no sufficient color is found.
- (UIColor *)backgroundColorToContrastAgainstColors:(NSArray *)colors withMinimumContrast:(UIColorContrast)minimumContrast NS_AVAILABLE_IOS(5_0);


#pragma mark - Key Color

/// The key color that appears to dominate the receiving image.
/// @return A @cUIImage object for the key color that appears to dominate the receiving image.
/// @warning Returns nil if no key-color appropriate color is found.
- (UIColor *)keyColor NS_AVAILABLE_IOS(5_0);

/// The key color that appears to dominate the receiving image that contasts with specified colors.
/// @param color An array of colors that the returned color needs to contrast with.
/// @param contrast The perceived difference in color difference.
/// @return A @cUIImage object for a sufficient key color that appears to dominate the receiving image.
/// @warning Returns nil if no sufficient key-color appropriate color is found.
- (UIColor *)keyColorToContrastAgainstColors:(NSArray *)colors withMinimumContrast:(UIColorContrast)minimumContrast NS_AVAILABLE_IOS(5_0);

@end
