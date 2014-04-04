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
			                     [UIColor neueGray],
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
	return [UIColor colorWithHexString:@"FF3B30"];
}

// #FF9500
+ (UIColor *)neueOrange
{
	return [UIColor colorWithHexString:@"FF9500"];
}

// #FFCC00
+ (UIColor *)neueYellow
{
	return [UIColor colorWithHexString:@"FFCC00"];
}

// #4CD964
+ (UIColor *)neueGreen
{
	return [UIColor colorWithHexString:@"4CD964"];
}

// #34AADC
+ (UIColor *)neueLightBlue
{
	return [UIColor colorWithHexString:@"34AADC"];
}

// #007AFF
+ (UIColor *)neueBlue
{
	return [UIColor colorWithHexString:@"007AFF"];
}

// #5856D6
+ (UIColor *)neuePurple
{
	return [UIColor colorWithHexString:@"5856D6"];
}

// #FF2D55
+ (UIColor *)neuePink
{
	return [UIColor colorWithHexString:@"FF2D55"];
}

// #8E8E93
+ (UIColor *)neueGray
{
	return [UIColor colorWithHexString:@"8E8E93"];
}

// #C7C7CC
+ (UIColor *)neueLightGray
{
	return [UIColor colorWithHexString:@"C7C7CC"];
}


#pragma mark iPhone 5c Colors

// #46ABE0
+ (UIColor *)cBlue
{
	return [UIColor colorWithHexString:@"46ABE0"];
}

// #A1E877
+ (UIColor *)cGreen
{
	return [UIColor colorWithHexString:@"A1E877"];
}

// #F5F4F7
+ (UIColor *)cWhite
{
	return [UIColor colorWithHexString:@"F5F4F7"];
}

// #FAF189
+ (UIColor *)cYellow
{
	return [UIColor colorWithHexString:@"FAF189"];
}

// #FE767A
+ (UIColor *)cPink
{
	return [UIColor colorWithHexString:@"FE767A"];
}


#pragma mark iPhone 5s Colors

// #99989B
+ (UIColor *)sSpaceGray
{
	return [UIColor colorWithHexString:@"99989B"];
}

// #D7D9D8
+ (UIColor *)sGold
{
	return [UIColor colorWithHexString:@"D4C5B3"];
}

// #D4C5B3
+ (UIColor *)sSilver
{
	return [UIColor colorWithHexString:@"D7D9D8"];
}

@end
