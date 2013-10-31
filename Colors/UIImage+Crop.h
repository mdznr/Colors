//
//  UIImage+Crop.h
//  Colors
//
//  Created by Matt Zanchelli on 9/23/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import UIKit;

@interface UIImage (Crop)

/// Create a cropped version of the receiving image object.
/// @param rect The rectangular area to crop the receiver to.
/// @discussion The rect is bounded to the bounds of the image.
/// @return An image object cropped to the rectangle section of the receiver.
- (UIImage *)croppedImageWithRect:(CGRect)rect;

/// Create a scaled version of the receiving image object.
/// @param size The size the image should be scaled to
/// @return An image object scaled to the specified size.
- (UIImage*)scaleToSize:(CGSize)size;

/// Create a scaled version of the receiving image object.
/// @param size The size the image should be scaled to.
/// @param interpolationQuality The interpolation quality of the scaling.
/// @return An image object scaled to the specified size using the specified interpolation quality.
- (UIImage *)scaleToSize:(CGSize)size
withInterpolationQuality:(CGInterpolationQuality)interpolationQuality;

@end
