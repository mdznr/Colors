//
//  UIImage+Crop.h
//  Colors
//
//  Created by Matt Zanchelli on 9/23/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import UIKit;

@interface UIImage (Crop)

/*
 Methods for cropping and scaling images
 */

#pragma mark Crop

/// Create a cropped version of the receiving image object.
/// @param rect The rectangular area to crop the receiver to.
/// @discussion The rect is bounded to the bounds of the image.
/// @return An image object cropped to the rectangle section of the receiver.
- (UIImage *)croppedImageWithRect:(CGRect)rect;


#pragma mark Scale

/// Create a scaled version of the receiving image object.
/// @param size The size the image should be scaled to.
/// @return An image object scaled to the specified size.
- (UIImage*)scaleToSize:(CGSize)size;

/// Create a scaled version of the receiving image object optionally maintaining the aspect ratio.
/// @param size The size the image should be scale to fit to.
/// @param keepAspectRatio Optionally keep the aspect ratio.
/// @discussion When keeping aspect ratio, this fits the image to the largest dimension. Do not expect output image size to match size parameter exactly.
/// @return An image object scaled to the specified size and optionally maintaining aspect ratio.
- (UIImage *)scaleToSize:(CGSize)size
      keepingAspectRatio:(BOOL)keepAspectRatio;

/// Create a scaled version of the receiving image object optionally maintaining the aspect ratio.
/// @param size The size the image should be scale to fit to.
/// @param interpolationQuality The interpolation quality of the scaling.
/// @param keepAspectRatio Optionally keep the aspect ratio.
/// @discussion When keeping aspect ratio, this fits the image to the largest dimension. Do not expect output image size to match size parameter exactly.
/// @return An image object scaled to the specified size using the specified interpolation quality and optionally maintaining aspect ratio.
- (UIImage *)scaleToSize:(CGSize)size
withInterpolationQuality:(CGInterpolationQuality)interpolationQuality
      keepingAspectRatio:(BOOL)keepAspectRatio;

/// Create a scaled version of the receiving image object.
/// @param size The size the image should be scaled to.
/// @param interpolationQuality The interpolation quality of the scaling.
/// @return An image object scaled to the specified size using the specified interpolation quality.
- (UIImage *)scaleToSize:(CGSize)size
withInterpolationQuality:(CGInterpolationQuality)interpolationQuality;

@end
