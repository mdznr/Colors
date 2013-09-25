//
//  UIImage+Colors.h
//  Colors
//
//  Created by Matt Zanchelli on 9/24/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Colors)

/// The color that appears to dominate the background of the image
- (UIColor *)backgroundColor;

/// The key color that appears to dominate the foreground of the image
- (UIColor *)foregroundColor;

@end
