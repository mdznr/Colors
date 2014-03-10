//
//  UIImage+Crop.m
//  Colors
//
//  Created by Matt Zanchelli on 9/23/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "UIImage+Crop.h"
#import "CGRectManipulation.h"

@implementation UIImage (Crop)


#pragma mark Crop

// Implementation with help from http://stackoverflow.com/questions/158914/cropping-a-uiimage
- (UIImage *)croppedImageWithRect:(CGRect)rect
{
	// Scaling only necessary if it's not 1.0
	if ( self.scale != 1.0f ) {
		rect = CGRectScale(rect, self.scale);
	}
	
	CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
	
	UIImage *newImage = [UIImage imageWithCGImage:imageRef];
	
	CGImageRelease(imageRef);
	
	return newImage;
}


#pragma mark Scale

- (UIImage*)scaleToSize:(CGSize)size
{
	return [self scaleToSize:size
	withInterpolationQuality:kCGInterpolationDefault];	
}

- (UIImage *)scaleToSize:(CGSize)size
      keepingAspectRatio:(BOOL)keepAspectRatio
{
    return [self scaleToSize:size
    withInterpolationQuality:kCGInterpolationDefault
          keepingAspectRatio:keepAspectRatio];
}

- (UIImage *)scaleToSize:(CGSize)size
withInterpolationQuality:(CGInterpolationQuality)interpolationQuality
      keepingAspectRatio:(BOOL)keepAspectRatio
{
    CGSize newSize = size;
    if ( keepAspectRatio ) {
        if ( self.size.width < self.size.height ) {
            // Tall image
			newSize = CGSizeMake(size.height * (self.size.width/self.size.height), size.height);
        } else {
            // Not-tall image
            newSize = CGSizeMake(size.width, size.width * (self.size.width/self.size.height));
        }
    }
    return [self scaleToSize:newSize withInterpolationQuality:interpolationQuality];
}

// Implementation from http://stackoverflow.com/questions/11909502/scale-down-a-uiimage
- (UIImage *)scaleToSize:(CGSize)size
withInterpolationQuality:(CGInterpolationQuality)interpolationQuality
{
	UIGraphicsBeginImageContext(size);
	
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0.0, size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
	
	CGContextSetInterpolationQuality(context, interpolationQuality);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, size.width, size.height), self.CGImage);
	
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
	
    UIGraphicsEndImageContext();
	
    return scaledImage;
}

@end
