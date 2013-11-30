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

+ (UIColor *)neueRed
{
	return [UIColor colorWithRed:255/255.0f green:59/255.0f blue:48/255.0f alpha:1.0f];
}

+ (UIColor *)neueOrange
{
	return [UIColor colorWithRed:255/255.0f green:149/255.0f blue:0/255.0f alpha:1.0f];
}

+ (UIColor *)neueYellow
{
	return [UIColor colorWithRed:255/255.0f green:204/255.0f blue:0/255.0f alpha:1.0f];
}

+ (UIColor *)neueGreen
{
	return [UIColor colorWithRed:76/255.0f green:217/255.0f blue:100/255.0f alpha:1.0f];
}

+ (UIColor *)neueLightBlue
{
	return [UIColor colorWithHex:@"34AADC"];
}

+ (UIColor *)neueBlue
{
	return [UIColor colorWithRed:0/255.0f green:122/255.0f blue:255/255.0f alpha:1.0f];
}

+ (UIColor *)neuePurple
{
	return [UIColor colorWithHex:@"5856D6"];
}

+ (UIColor *)neuePink
{
	return [UIColor colorWithHex:@"FF2D55"];
}

+ (UIColor *)neueGray
{
	return [UIColor colorWithRed:142/255.0f green:142/255.0f blue:147/255.0f alpha:1.0f];
}

+ (UIColor *)neueLightGray
{
	return [UIColor colorWithHex:@"C7C7CC"];
}


#pragma mark iPhone 5c Colors

+ (UIColor *)cBlue
{
	return [UIColor colorWithHex:@"46ABE0"];
}

+ (UIColor *)cGreen
{
	return [UIColor colorWithHex:@"A1E877"];
}

+ (UIColor *)cWhite
{
	return [UIColor colorWithHex:@"F5F4F7"];
}

+ (UIColor *)cYellow
{
	return [UIColor colorWithHex:@"FAF189"];
}

+ (UIColor *)cPink
{
	return [UIColor colorWithHex:@"FE767A"];
}


#pragma mark iPhone 5s Colors

+ (UIColor *)sSpaceGray
{
	return [UIColor colorWithHex:@"99989B"];
}

+ (UIColor *)sGold
{
	return [UIColor colorWithHex:@"D7D9D8"];
}

+ (UIColor *)sSilver
{
	return [UIColor colorWithHex:@"D4C5B3"];
}

@end
