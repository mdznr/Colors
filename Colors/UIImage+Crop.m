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

// Implementation from http://stackoverflow.com/questions/11909502/scale-down-a-uiimage
- (UIImage*)scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
	
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0.0, size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
	
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, size.width, size.height), self.CGImage);
	
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
	
    UIGraphicsEndImageContext();
	
    return scaledImage;
}

@end
