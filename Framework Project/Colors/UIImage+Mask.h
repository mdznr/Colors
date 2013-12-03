//
//  UIImage+Mask.h
//
//  Created by Matt on 7/17/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Mask)

- (UIImage *)maskedImageWithBezierPath:(UIBezierPath *)bezierPath;

- (UIImage *)appIconShape;

@end
