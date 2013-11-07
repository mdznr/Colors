//
//  UIColor+Components.m
//  Colors
//
//  Created by Matt on 9/3/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "UIColor+Components.h"
#import <tgmath.h>

@implementation UIColor (Components)

#pragma mark - RGB

- (CGFloat)redComponent
{
	CGFloat r,g,b,a;
	if ( ![self getRed:&r green:&g blue:&b alpha:&a] ) {
		return -1;
	}
	return r;
}

- (CGFloat)greenComponent
{
	CGFloat r,g,b,a;
	if ( ![self getRed:&r green:&g blue:&b alpha:&a] ) {
		return -1;
	}
	return g;
}

- (CGFloat)blueComponent
{
	CGFloat r,g,b,a;
	if ( ![self getRed:&r green:&g blue:&b alpha:&a] ) {
		return -1;
	}
	return b;
}


#pragma mark - HSB

- (CGFloat)hue
{
	CGFloat h,s,b,a;
	if ( ![self getHue:&h saturation:&s brightness:&b alpha:&a] ) {
		return -1;
	}
	return h;
}

- (CGFloat)saturation
{
	CGFloat h,s,b,a;
	if ( ![self getHue:&h saturation:&s brightness:&b alpha:&a] ) {
		return -1;
	}
	return s;
}

- (CGFloat)brightness
{
	CGFloat h,s,b,a;
	if ( ![self getHue:&h saturation:&s brightness:&b alpha:&a] ) {
		return -1;
	}
	return b;
}


#pragma mark - YUV

// Conversion with help from http://www.fourcc.org/fccyvrgb.php
- (CGFloat)yValue
{
	// RGB -> YUV conversion assumes 0-255 scale for components
	CGFloat r,g,b,a;
	if ( ![self getRed:&r green:&g blue:&b alpha:&a] ) {
		return -1;
	}
	
	r *= 255;
	g *= 255;
	b *= 255;
	
	CGFloat y = (0.257 * r) + (0.504 * g) + (0.098 * b) + 16;
	y = MIN(MAX(0,y),255);
	return y;
}

- (CGFloat)uValue
{
	// RGB -> YUV conversion assumes 0-255 scale for components
	CGFloat r,g,b,a;
	if ( ![self getRed:&r green:&g blue:&b alpha:&a] ) {
		return -1;
	}
	
	r *= 255;
	g *= 255;
	b *= 255;
	
	CGFloat u = -(0.148 * r) - (0.291 * g) + (0.439 * b) + 128;
	u = MIN(MAX(0,u),255);
	return u;
}

- (CGFloat)vValue
{
	// RGB -> YUV conversion assumes 0-255 scale for components
	CGFloat r,g,b,a;
	if ( ![self getRed:&r green:&g blue:&b alpha:&a] ) {
		return -1;
	}
	
	r *= 255;
	g *= 255;
	b *= 255;
	
	CGFloat v = (0.439 * r) - (0.368 * g) - (0.071 * b) + 128;
	v = MIN(MAX(0,v),255);
	return v;
}


#pragma mark - CIE-LAB
// RGB -> XYZ -> CIE-LAB via http://www.easyrgb.com/index.php?X=MATH&H=07#text7

- (CGFloat)CIELab_LValue
{
	CGFloat r,g,b,a;
	if ( ![self getRed:&r green:&g blue:&b alpha:&a] ) {
		return -1;
	}
	
	// Convert to XYZ
	if ( r > 0.04045 ) r = pow(((r + 0.055)/1.055), 2.4);
	else               r /= 12.92;
	if ( g > 0.04045 ) g = pow(((g + 0.055)/1.055), 2.4);
	else               g /= 12.92;
	if ( b > 0.04045 ) b = pow(((b + 0.055)/1.055), 2.4);
	else               b /= 12.92;
	
	r *= 100;
	g *= 100;
	b *= 100;
	
	// Observer = 2°, Illuminant = D65
	CGFloat y = r * 0.2126 + g * 0.7152 + b * 0.0722;
	
	// Convert to LAB
	// Observer = 2°, Illuminant = D65
	y /= 100.000;
	
	if ( y > 0.008856 ) y = pow(y, 1.0f/3.0f);
	else                y = ( 7.787 * y ) + ( 16 / 116 );

	CGFloat labL = ( 116 * y ) - 16;
	
	// RGB: (-16, labL, 100)
	return MIN(MAX(-16,labL),100);
}

- (CGFloat)CIELab_aValue
{
	CGFloat r,g,b,a;
	if ( ![self getRed:&r green:&g blue:&b alpha:&a] ) {
		return -1;
	}
	
	// Convert to XYZ
	if ( r > 0.04045 ) r = pow(((r + 0.055)/1.055), 2.4);
	else               r /= 12.92;
	if ( g > 0.04045 ) g = pow(((g + 0.055)/1.055), 2.4);
	else               g /= 12.92;
	if ( b > 0.04045 ) b = pow(((b + 0.055)/1.055), 2.4);
	else               b /= 12.92;

	r *= 100;
	g *= 100;
	b *= 100;

	//Observer = 2°, Illuminant = D65
	CGFloat x = r * 0.4124 + g * 0.3576 + b * 0.1805;
	CGFloat y = r * 0.2126 + g * 0.7152 + b * 0.0722;
	
	// Convert to LAB
	// Observer = 2°, Illuminant = D65
	x /= 95.047;
	y /= 100.000;
	
	if ( x > 0.008856 ) x = pow(x, 1.0f/3.0f);
	else                x = ( 7.787 * x ) + ( 16 / 116 );
	if ( y > 0.008856 ) y = pow(y, 1.0f/3.0f);
	else                y = ( 7.787 * y ) + ( 16 / 116 );
	
	CGFloat labA = 500 * ( x - y );
	
	// RGB: (-86.2, labA, 100)
	return MIN(MAX(-86.2,labA),98.3);
}

- (CGFloat)CIELab_bValue
{
	CGFloat r,g,b,a;
	if ( ![self getRed:&r green:&g blue:&b alpha:&a] ) {
		return -1;
	}
	
	// Convert to XYZ
	if ( r > 0.04045 ) r = pow(((r + 0.055)/1.055), 2.4);
	else               r /= 12.92;
	if ( g > 0.04045 ) g = pow(((g + 0.055)/1.055), 2.4);
	else               g /= 12.92;
	if ( b > 0.04045 ) b = pow(((b + 0.055)/1.055), 2.4);
	else               b /= 12.92;
	
	r *= 100;
	g *= 100;
	b *= 100;
	
	// Observer = 2°, Illuminant = D65
	CGFloat y = r * 0.2126 + g * 0.7152 + b * 0.0722;
	CGFloat z = r * 0.0193 + g * 0.1192 + b * 0.9505;
	
	// Convert to LAB
	// Observer = 2°, Illuminant = D65
	y /= 100.000;
	z /= 108.883;
	
	if ( y > 0.008856 ) y = pow(y, 1.0f/3.0f);
	else                y = ( 7.787 * y ) + ( 16 / 116 );
	if ( z > 0.008856 ) z = pow(z, 1.0f/3.0f);
	else                z = ( 7.787 * z ) + ( 16 / 116 );
	
	CGFloat labB = 200 * ( y - z );
	
	// RGB: (-86.2, labA, 100)
	return MIN(MAX(-86.2,labB),98.3);
}

+ (UIColor *)colorWithCIELabL:(CGFloat)labL a:(CGFloat)labA b:(CGFloat)labB;
{
	// Convert to XYZ
	CGFloat y = ( labL + 16 ) / 116;
	CGFloat x = labA / 500 + y;
	CGFloat z = y - labB / 200;
	
	if ( pow(y,3) > 0.008856 ) y = pow(y,3);
	else                       y = ( y - 16 / 116 ) / 7.787;
	if ( pow(x,3) > 0.008856 ) x = pow(x,3);
	else                       x = ( x - 16 / 116 ) / 7.787;
	if ( pow(z,3) > 0.008856 ) z = pow(z,3);
	else                       z = ( z - 16 / 116 ) / 7.787;
	
	// Observer = 2°, Illuminant= D65
	x *= 95.047;
	y *= 100.000;
	z *= 108.883;
	
	x /= 100; // X from 0 to  95.047
	y /= 100; // Y from 0 to 100.000
	z /= 100; // Z from 0 to 108.883
	
	CGFloat r = x *  3.2406 + y * -1.5372 + z * -0.4986;
	CGFloat g = x * -0.9689 + y *  1.8758 + z *  0.0415;
	CGFloat b = x *  0.0557 + y * -0.2040 + z *  1.0570;
	
	if ( r > 0.0031308 ) r = 1.055 * ( pow(r,(1/2.4)) ) - 0.055;
	else                 r = 12.92 * r;
	if ( g > 0.0031308 ) g = 1.055 * ( pow(g,(1/2.4)) ) - 0.055;
	else                 g = 12.92 * g;
	if ( b > 0.0031308 ) b = 1.055 * ( pow(b,(1/2.4)) ) - 0.055;
	else                 b = 12.92 * b;
	
	
	return [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
}

@end
