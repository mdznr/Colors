//
//  UIColor+Hex.m
//  Colors
//
//  Created by Matt on 9/2/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "UIColor+Hex.h"
#import "NSNumber+Hex.h"

@implementation UIColor (Hex)

// Creates and returns a UIColor from a hexidemical color string
// Hex strings must contain values
+ (UIColor *)colorWithHex:(NSString *)hexString
{
	NSString *hexRegex = @"^#?[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]$";
	
	NSError *error = NULL;
	NSRegularExpression *hexColorRegex =
		[NSRegularExpression regularExpressionWithPattern:hexRegex
												  options:NSRegularExpressionCaseInsensitive
													error:&error];
	
	if ( error ) {
		NSLog(@"Error: There was an error creating regular expression for hex colors");
		return nil;
	}

	NSUInteger numberOfMatches = [hexColorRegex numberOfMatchesInString:hexString
																options:NSMatchingReportCompletion
																  range:NSMakeRange(0, hexString.length)];
	
	if ( numberOfMatches != 1 ) {
		NSLog(@"Error: '%@' is not a valid hexadecimal color string", hexString);
		return nil;
	}
	
	if ( hexString.length == 7 ) {
		hexString = [hexString substringWithRange:NSMakeRange(1, 6)];
	}
	NSNumber *red   = [NSNumber numberWithHex:[hexString substringWithRange:NSMakeRange(0, 2)]];
	NSNumber *green = [NSNumber numberWithHex:[hexString substringWithRange:NSMakeRange(2, 2)]];
	NSNumber *blue  = [NSNumber numberWithHex:[hexString substringWithRange:NSMakeRange(4, 2)]];
	return [UIColor colorWithRed:  red.floatValue/255.0f
						   green:green.floatValue/255.0f
							blue: blue.floatValue/255.0f
						   alpha:1.0f];
}

- (NSString *)hexString
{
#warning TODO: get r,g,b convert back to hex.
	return nil;
}

@end
