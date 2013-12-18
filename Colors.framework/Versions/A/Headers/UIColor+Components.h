//
//  UIColor+Components.h
//  Colors
//
//  Created by Matt on 9/3/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import UIKit;

@interface UIColor (Components)

/*
 Contains methods to get different component values for different colorspaces including RGB, CMYK, HSB, YUV, and CIE-LAB.
 */

#pragma mark - RGB

/// Returns the receiver’s red component (RGB).
/// @return The value of the receiver’s red component (R) in the RGB colorspace. If the receiver is unable to be converted into RGB colorspace, returns -1.
- (CGFloat)redComponent NS_AVAILABLE_IOS(5_0);

/// Returns the receiver's green component (RGB).
/// @return The value of the receiver’s green component (G) in the RGB colorspace. If the receiver is unable to be converted into RGB colorspace, returns -1.
- (CGFloat)greenComponent NS_AVAILABLE_IOS(5_0);

/// Returns the receiver's blue component (RGB).
/// @return The value of the receiver’s blue component (B) in the RGB colorspace. If the receiver is unable to be converted into RGB colorspace, returns -1.
- (CGFloat)blueComponent NS_AVAILABLE_IOS(5_0);


#pragma mark - HSB

/// Returns the receiver's hue component (HSB).
/// @return The value of the receiver's hue component (H) in the HSB colorspace. If the receiver is unable to converted into HSB colorspace, returns -1.
- (CGFloat)hue NS_AVAILABLE_IOS(5_0);

/// Returns the receiver's saturation component (HSB).
/// @return The value of the receiver's saturation component (S) in the HSB colorspace. If the receiver is unable to converted into HSB colorspace, returns -1.
- (CGFloat)saturation NS_AVAILABLE_IOS(5_0);

/// Returns the receiver's brightness component (HSB).
/// @return The value of the reveiver's brightness component (B) in the HSB colorspace. If the receiver is unable to converted into HSB colorspace, returns -1.
- (CGFloat)brightness NS_AVAILABLE_IOS(5_0);


#pragma mark - YUV

/// Returns the receiver's luma (Y) component (YUV).
/// @return The value of the receiver's luma component (Y) in the YUV colorspace. If the receiver is unable to converted into YUV colorspace, returns -1.
- (CGFloat)yValue NS_AVAILABLE_IOS(5_0);

/// Returns the value of the receiver's first chrominance (U) components (YUV).
/// @return The value of the receiver's first chrominance component (U) in the YUV colorspace. If the receiver is unable to converted into YUV colorspace, returns -1.
- (CGFloat)uValue NS_AVAILABLE_IOS(5_0);

/// Returns the value of the receiver's second chrominance (V) components (YUV).
/// @return The value of the receiver's second chrominance component (V) in the YUV colorspace. If the receiver is unable to converted into YUV colorspace, returns -1.
- (CGFloat)vValue NS_AVAILABLE_IOS(5_0);


#pragma mark - CIE-LAB

/// Returns the receiver's lightness (L) component (LAB).
/// @return The value of the receiver's lightness component (L) in the LAB colorspace. If the receiver is unable to be converted into the LAB colorspace, returns -1;
- (CGFloat)CIELab_LValue NS_AVAILABLE_IOS(5_0);

/// Returns one of the receiver's color (a) components (LAB).
/// @return The value of the receiver's first color component (a) in the LAB colorspace. If the receiver is unable to be converted into the LAB colorspace, returns -1;
- (CGFloat)CIELab_aValue NS_AVAILABLE_IOS(5_0);

/// Returns the value of the receiver's second color (b) component (LAB).
/// @return The value of the receiver's second color component (b) in the LAB colorspace. If the receiver is unable to be converted into the LAB colorspace, returns -1;
- (CGFloat)CIELab_bValue NS_AVAILABLE_IOS(5_0);

/// Create a color object using the specified CIELAB color component values
/// @param L The value of the lightness component.
/// @param a The value of the a color component.
/// @param b The value of the b color component.
/// @return The color object. The color information represented by this object is in the device RGB colorspace.
/// @discussion Even though the CIE-Lab colorspace can handle colors outside the range of RGB, this method converts to RGB for use with UIColor.
+ (UIColor *)colorWithCIELabL:(CGFloat)L a:(CGFloat)a b:(CGFloat)b NS_AVAILABLE_IOS(5_0);

@end
