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
- (CGFloat)redComponent;
/// Returns the receiver's green component (RGB).
- (CGFloat)greenComponent;
/// Returns the receiver's blue component (RGB).
- (CGFloat)blueComponent;

#pragma mark - CMYK
/// Returns the receiver's cyan component (CMYK).
- (CGFloat)cyanComponent;
/// Returns the receiver's magenta component (CMYK).
- (CGFloat)magentaComponent;
/// Returns the receiver's yellow component (CMYK).
- (CGFloat)yellowComponent;
/// Returns the receiver's black component (CMYK).
- (CGFloat)blackComponent;

#pragma mark - HSB
/// Returns the receiver's hue component (HSB).
- (CGFloat)hue;
/// Returns the receiver's saturation component (HSB).
- (CGFloat)saturation;
/// Returns the receiver's brightness component (HSB).
- (CGFloat)brightness;

#pragma mark - YUV
/// Returns the receiver's luma (Y) component (YUV).
- (CGFloat)yValue;
/// Returns one of the receiver's chrominance (U) components (YUV).
- (CGFloat)uValue;
/// Returns one of the receiver's chrominance (V) components (YUV).
- (CGFloat)vValue;

#pragma mark - CIE-LAB
/// Returns the receiver's lightness (L) component (LAB).
- (CGFloat)CIELab_LValue;
/// Returns one of the receiver's color (a) components (LAB).
- (CGFloat)CIELab_aValue;
/// Returns one of the receiver's color (b) components (LAB).
- (CGFloat)CIELab_bValue;

/// Create a color object using the specified CIELAB color component values
/// @param L The value of the lightness component.
/// @param a The value of the a component.
/// @param b The value of the b component.
/// @return The color object. The color information represented by this object is in the device RGB colorspace.
+ (UIColor *)colorWithCIELabL:(CGFloat)L a:(CGFloat)a b:(CGFloat)b;

@end
