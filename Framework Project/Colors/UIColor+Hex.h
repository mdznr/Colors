//
//  UIColor+Hex.h
//  Colors
//
//  Created by Matt on 9/2/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import UIKit;

@interface UIColor (Hex)

/*
 Methods for creating and managing colors using HEX values.
 */

/// Creates a color object using the specified HEX string.
/// @param hexString A 6-digit hexadecimal string representing the string.
/// @discussion hexString Does not necessarily need the '#' prefix.
/// @return A Core Image color object that represents an RGB color in the color space specified by the Quartz 2D constant kCGColorSpaceGenericRGB.
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/// Returns a string containing 6 hexadecimal characters representing the receiver.
/// @discussion Example: [UIColor whiteColor] returns "#FFFFFF".
/// @discussion [UIColor redColor] returns "#FF0000".
/// @return A 6 digital hexadecimal string representing the receiving color object.
- (NSString *)hexString;

@end
