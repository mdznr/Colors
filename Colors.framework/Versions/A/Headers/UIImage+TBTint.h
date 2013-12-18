//
//  UIImage+TBTint.h
//  Blender
//
//  Created by Gordon Fontenot on 3/29/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

@import UIKit;

@interface UIImage (TBTint)

/*
 Provides ways of tinting images.
 */

/// Creates a tinted image with a specified color and retain its original brightness gradient.
/// @param tintColor The color to tint the image with/
/// @return An image object with the specified tint color applied to the receiver.
- (UIImage *)tintedGradientImageWithColor:(UIColor *)tintColor;

/// Creates a tinted image with a specified color.
/// @param tintColor The color to tint the image with.
/// @return An image object with the specified tint color applied to the receiver.
- (UIImage *)tintedImageWithColor:(UIColor *)tintColor;

@end
