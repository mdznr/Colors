//
//  UIImage+Crop.h
//  Colors
//
//  Created by Matt Zanchelli on 9/23/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Crop)

///
- (UIImage *)croppedImageWithRect:(CGRect)rect;

///
- (UIImage*)scaleToSize:(CGSize)size;

///
- (UIImage *)scaleToSize:(CGSize)size
withInterpolationQuality:(CGInterpolationQuality)interpolationQuality;

@end
