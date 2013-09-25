//
//  UIColor+Components.m
//  Colors
//
//  Created by Matt on 9/3/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "UIColor+Components.h"

@implementation UIColor (Components)

#pragma mark - RGB

- (CGFloat)redComponent
{
	CGFloat r,g,b,a;
	[self getRed:&r green:&g blue:&b alpha:&a];
	return r;
}

- (CGFloat)greenComponent
{
	CGFloat r,g,b,a;
	[self getRed:&r green:&g blue:&b alpha:&a];
	return g;
}

- (CGFloat)blueComponent
{
	CGFloat r,g,b,a;
	[self getRed:&r green:&g blue:&b alpha:&a];
	return b;
}


#pragma mark - CMYK

- (CGFloat)cyanComponent
{
#warning TODO
	return 0;
}

- (CGFloat)magentaComponent
{
#warning TODO
	return 0;
}

- (CGFloat)yellowComponent
{
#warning TODO
	return 0;
}

- (CGFloat)blackComponent
{
#warning TODO
	return 0;
}


#pragma mark - HSB

- (CGFloat)hue
{
	CGFloat h,s,b,a;
	[self getHue:&h saturation:&s brightness:&b alpha:&a];
	return h;
}

- (CGFloat)saturation
{
	CGFloat h,s,b,a;
	[self getHue:&h saturation:&s brightness:&b alpha:&a];
	return s;
}

- (CGFloat)brightness
{
	CGFloat h,s,b,a;
	[self getHue:&h saturation:&s brightness:&b alpha:&a];
	return b;
}


// YUV
// Conversion with help from http://www.fourcc.org/fccyvrgb.php
- (CGFloat)yValue
{
	// RGB -> YUV conversion assumes 0-255 scale for components
	CGFloat r,g,b,a;
	[self getRed:&r green:&g blue:&b alpha:&a];
	r *= 255;
	g *= 255;
	b *= 255;
	
	CGFloat y = (0.257 * r) + (0.504 * g) + (0.098 * b) + 16;
	return y;
}

- (CGFloat)uValue
{
	// RGB -> YUV conversion assumes 0-255 scale for components
	CGFloat r,g,b,a;
	[self getRed:&r green:&g blue:&b alpha:&a];
	r *= 255;
	g *= 255;
	b *= 255;
	
	CGFloat u = -(0.148 * r) - (0.291 * g) + (0.439 * b) + 128;
	return u;
}

- (CGFloat)vValue
{
	// RGB -> YUV conversion assumes 0-255 scale for components
	CGFloat r,g,b,a;
	[self getRed:&r green:&g blue:&b alpha:&a];
	r *= 255;
	g *= 255;
	b *= 255;
	
	CGFloat v = (0.439 * r) - (0.368 * g) - (0.071 * b) + 128;
	return v;
}

@end
