//
//  UIColor+Components.h
//  Colors
//
//  Created by Matt on 9/3/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import UIKit;

@interface UIColor (Components)

// RGB
- (CGFloat)redComponent;
- (CGFloat)greenComponent;
- (CGFloat)blueComponent;

// CMYK
- (CGFloat)cyanComponent;
- (CGFloat)magentaComponent;
- (CGFloat)yellowComponent;
- (CGFloat)blackComponent;

// HSB
- (CGFloat)hue;
- (CGFloat)saturation;
- (CGFloat)brightness;

// YUV
- (CGFloat)yValue;
- (CGFloat)uValue;
- (CGFloat)vValue;

// CIE-L*ab
- (double)CIELab_LValue;
- (double)CIELab_aValue;
- (double)CIELab_bValue;

+ (UIColor *)colorWithCIELabL:(double)labL a:(double)labA b:(double)labB;

@end
