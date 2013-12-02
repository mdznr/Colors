//
//  UIColor+NeueColors.m
//  Colors
//
//  Created by Matt on 9/2/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "UIColor+NeueColors.h"
#import "UIColor+Hex.h"

@implementation UIColor (NeueColors)

#pragma mark Color Sets

+ (NSSet *)neueColors
{
	return [NSSet setWithObjects:[UIColor neueRed],
			                     [UIColor neueOrange],
			                     [UIColor neueYellow],
			                     [UIColor neueGreen],
			                     [UIColor neueLightBlue],
			                     [UIColor neueBlue],
			                     [UIColor neuePurple],
			                     [UIColor neuePink],
			                     [UIColor neueDarkGray],
			                     [UIColor neueLightGray],
			                     [UIColor cBlue],
			                     [UIColor cGreen],
			                     [UIColor cWhite],
			                     [UIColor cYellow],
			                     [UIColor cPink],
			                     [UIColor sSpaceGray],
			                     [UIColor sSilver],
			                     [UIColor sGold], nil];
}

+ (NSSet *)neueKeyColors
{
	return [NSSet setWithObjects:[UIColor neueRed],
			                     [UIColor neueOrange],
			                     [UIColor neueYellow],
			                     [UIColor neueGreen],
			                     [UIColor neueLightBlue],
			                     [UIColor neueBlue],
			                     [UIColor neuePurple],
			                     [UIColor neuePink],
			                     [UIColor cBlue],
			                     [UIColor cGreen],
			                     [UIColor cYellow],
			                     [UIColor cPink],nil];
}

+ (NSSet *)cColors
{
	return [NSSet setWithObjects:[UIColor cBlue],
			                     [UIColor cGreen],
			                     [UIColor cWhite],
			                     [UIColor cYellow],
			                     [UIColor cPink], nil];
}

+ (NSSet *)sColors
{
	return [NSSet setWithObjects:[UIColor sSpaceGray],
			                     [UIColor sSilver],
			                     [UIColor sGold], nil];
}

#pragma mark iOS 7 UI Colors

// #FF3B30
+ (UIColor *)neueRed
{
	return [UIColor colorWithHex:@"FF3B30"];
}

// #FF9500
+ (UIColor *)neueOrange
{
	return [UIColor colorWithHex:@"FF9500"];
}

// #FFCC00
+ (UIColor *)neueYellow
{
	return [UIColor colorWithHex:@"FFCC00"];
}

// #4CD964
+ (UIColor *)neueGreen
{
	return [UIColor colorWithHex:@"4CD964"];
}

// #34AADC
+ (UIColor *)neueLightBlue
{
	return [UIColor colorWithHex:@"34AADC"];
}

// #007AFF
+ (UIColor *)neueBlue
{
	return [UIColor colorWithHex:@"007AFF"];
}

// #5856D6
+ (UIColor *)neuePurple
{
	return [UIColor colorWithHex:@"5856D6"];
}

// #FF2D55
+ (UIColor *)neuePink
{
	return [UIColor colorWithHex:@"FF2D55"];
}

// #8E8E93
+ (UIColor *)neueDarkGray
{
	return [UIColor colorWithHex:@"8E8E93"];
}

// #C7C7CC
+ (UIColor *)neueLightGray
{
	return [UIColor colorWithHex:@"C7C7CC"];
}


#pragma mark iPhone 5c Colors

// #46ABE0
+ (UIColor *)cBlue
{
	return [UIColor colorWithHex:@"46ABE0"];
}

// #A1E877
+ (UIColor *)cGreen
{
	return [UIColor colorWithHex:@"A1E877"];
}

// #F5F4F7
+ (UIColor *)cWhite
{
	return [UIColor colorWithHex:@"F5F4F7"];
}

// #FAF189
+ (UIColor *)cYellow
{
	return [UIColor colorWithHex:@"FAF189"];
}

// #FE767A
+ (UIColor *)cPink
{
	return [UIColor colorWithHex:@"FE767A"];
}


#pragma mark iPhone 5s Colors

// #99989B
+ (UIColor *)sSpaceGray
{
	return [UIColor colorWithHex:@"99989B"];
}

// #D7D9D8
+ (UIColor *)sGold
{
	return [UIColor colorWithHex:@"D7D9D8"];
}

// #D4C5B3
+ (UIColor *)sSilver
{
	return [UIColor colorWithHex:@"D4C5B3"];
}

@end
