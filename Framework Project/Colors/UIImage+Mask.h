//
//  UIImage+Mask.h
//
//  Created by Matt on 7/17/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Mask)

/*
 Provides methods for masking images.
 */

/// Creates and returns an instance of @cUIImage by masking the image with the provided bezier path.
/// @param bezierPath the UIBezierPath to mask the image with
/// @return An image object resulting from the receiver masked with the provided bezier path.
- (UIImage *)maskedImageWithBezierPath:(UIBezierPath *)bezierPath;

/// Creates and returns an instance of @cUIImage by masking the receiver to the app icon shape.
/// @return An image object resulting from the receiver masked to the app icon shape.
- (UIImage *)appIconShape;

@end
