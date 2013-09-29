//
//  UIColor+Manipulation.h
//  Colors
//
//  Created by Matt Zanchelli on 9/24/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Manipulation)

/// Calculate the Euclidean Distance between colors in the YUV colorspace.
+ (float)euclideanDistanceFromColor:(UIColor *)color
							toColor:(UIColor *)anotherColor;

@end
