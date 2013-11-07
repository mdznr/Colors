//
//  UIColor+Components.h
//  Colors
//
//  Created by Matt on 9/3/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import UIKit;

@interface UIColor (Components)

#pragma mark - RGB
/// Returns the receiver’s red component (RGB).
/// @returns A float value of the receiver’s red component in the RGB colorspace. May return -1 if unable to convert to RGB.
- (CGFloat)redComponent NS_AVAILABLE_IOS(5_0);
/// Returns the receiver's green component (RGB).
/// @returns A float value of the receiver’s green component in the RGB colorspace. May return -1 if unable to convert to RGB.
- (CGFloat)greenComponent NS_AVAILABLE_IOS(5_0);
/// Returns the receiver's blue component (RGB).
/// @returns A float value of the receiver’s blue component in the RGB colorspace. May return -1 if unable to convert to RGB.
- (CGFloat)blueComponent NS_AVAILABLE_IOS(5_0);

#pragma mark - CMYK
/// Returns the receiver's cyan component (CMYK).
- (CGFloat)cyanComponent NS_AVAILABLE_IOS(5_0);
/// Returns the receiver's magenta component (CMYK).
- (CGFloat)magentaComponent NS_AVAILABLE_IOS(5_0);
/// Returns the receiver's yellow component (CMYK).
- (CGFloat)yellowComponent NS_AVAILABLE_IOS(5_0);
/// Returns the receiver's black component (CMYK).
- (CGFloat)blackComponent NS_AVAILABLE_IOS(5_0);

#pragma mark - HSB
/// Returns the receiver's hue component (HSB).
- (CGFloat)hue NS_AVAILABLE_IOS(5_0);
/// Returns the receiver's saturation component (HSB).
- (CGFloat)saturation NS_AVAILABLE_IOS(5_0);
/// Returns the receiver's brightness component (HSB).
- (CGFloat)brightness NS_AVAILABLE_IOS(5_0);

#pragma mark - YUV
/// Returns the receiver's luma (Y) component (YUV).
- (CGFloat)yValue NS_AVAILABLE_IOS(5_0);
/// Returns one of the receiver's chrominance (U) components (YUV).
- (CGFloat)uValue NS_AVAILABLE_IOS(5_0);
/// Returns one of the receiver's chrominance (V) components (YUV).
- (CGFloat)vValue NS_AVAILABLE_IOS(5_0);

#pragma mark - CIE-LAB
/// Returns the receiver's lightness (L) component (LAB).
- (CGFloat)CIELab_LValue NS_AVAILABLE_IOS(5_0);
/// Returns one of the receiver's color (a) components (LAB).
- (CGFloat)CIELab_aValue NS_AVAILABLE_IOS(5_0);
/// Returns one of the receiver's color (b) components (LAB).
- (CGFloat)CIELab_bValue NS_AVAILABLE_IOS(5_0);

/// Create a color object using the specified CIELAB color component values
/// @param L The value of the lightness component.
/// @param a The value of the a component.
/// @param b The value of the b component.
/// @return The color object. The color information represented by this object is in the device RGB colorspace.
/// @discussion Even though the CIELab colorspace can handle colors outside the range of RGB, this method converts to RGB for use with UIColor.
+ (UIColor *)colorWithCIELabL:(CGFloat)L a:(CGFloat)a b:(CGFloat)b NS_AVAILABLE_IOS(5_0);

@end
