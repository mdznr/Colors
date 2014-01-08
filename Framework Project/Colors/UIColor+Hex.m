//
//  UIColor+Hex.m
//  Colors
//
//  Created by Matt on 9/2/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "UIColor+Hex.h"
#import "UIColor+Components.h"
#import "NSNumber+Hex.h"

// Part of FCUtilities by Marco Arment.
// FCUtilities License:
/*
 The MIT License (MIT)
 
 Copyright (c) 2014 marcoarment
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 the Software, and to permit persons to whom the Software is furnished to do so,
 subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
#define fc_UIColorFromHexInt(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation UIColor (Hex)

// Creates and returns a UIColor from a hexidemical color string
// Hex strings must contain values
+ (UIColor *)colorWithHexString:(NSString *)hexString
{
// Part of FCUtilities by Marco Arment.
	unsigned hexNum;
	if ( ![[NSScanner scannerWithString:hexString] scanHexInt:&hexNum] ) {
		return nil;
	}
	return fc_UIColorFromHexInt(hexNum);
}


- (NSString *)hexString
{
	CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
	[self getRed:&red green:&green blue:&blue alpha:&alpha];
	
	NSNumber *r = [NSNumber numberWithFloat:red   * 255];
	NSNumber *g = [NSNumber numberWithFloat:green * 255];
	NSNumber *b = [NSNumber numberWithFloat:blue  * 255];
	
	NSString *hexString = [NSString stringWithFormat:@"%@%@%@", [r hexString],
															    [g hexString],
															    [b hexString]];
	return hexString;
}

@end
