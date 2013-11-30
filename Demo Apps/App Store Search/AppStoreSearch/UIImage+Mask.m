//
//  UIImage+Mask.m
//
//  Created by Matt on 7/17/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "UIImage+Mask.h"

@implementation UIImage (Mask)

- (UIImage *)maskedImageWithBezierPath:(UIBezierPath *)bezierPath
{
	CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
	UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
	[bezierPath addClip];
	[self drawInRect:rect];
	UIImage *maskedImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return maskedImage;
}

- (UIImage *)appIconShape
{
	UIBezierPath *bp = [UIBezierPath bezierPathWithRoundedRect:(CGRect){0,0,self.size.width,self.size.height}
												  cornerRadius:self.size.width/5.0];
	return [self maskedImageWithBezierPath:bp];
}

@end
