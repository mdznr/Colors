//
//  UIColor+NeueColors.h
//  Colors
//
//  Created by Matt on 9/2/13. 
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import UIKit;

@interface UIColor (NeueColors)

/*
 Includes the standard system colors used in Apple's default apps as well as the colors of device hardware.
 */

#pragma mark - Color Sets

/// A set of all the neue colors
+ (NSSet *)neueColors;

/// A set of all the neue colors that are possible key color candidates
+ (NSSet *)neueKeyColors;

/// A set of all the iPhone 5c colors
+ (NSSet *)cColors;

/// A set of all the iPhone 5s colors
+ (NSSet *)sColors;


#pragma mark - iOS 7 UI Colors

/// Returns the standard system color for red.
+ (UIColor *)neueRed;		// #FF3B30

/// Returns the standard system color for orange.
+ (UIColor *)neueOrange;	// #FF9500

/// Returns the standard system color for yellow.
+ (UIColor *)neueYellow;	// #FFCC00

/// Returns the standard system color for green.
+ (UIColor *)neueGreen;		// #4CD964

/// Returns the standard system color for light blue.
+ (UIColor *)neueLightBlue;	// #34AADC

/// Returns the standard system color for blue.
+ (UIColor *)neueBlue;		// #007AFF

/// Returns the standard system color for purple.
+ (UIColor *)neuePurple;	// #5856D6

/// Returns the standard system color for pink.
+ (UIColor *)neuePink;		// #FF2D55

/// Returns the standard system color for gray.
+ (UIColor *)neueGray;		// #8E8E93

/// Returns the standard system color for light gray.
+ (UIColor *)neueLightGray;	// #C7C7CC


#pragma mark - iPhone 5c Colors

/// Returns the color of the Blue iPhone 5c.
+ (UIColor *)cBlue;	  // #46ABE0

/// Returns the color of the Green iPhone 5c.
+ (UIColor *)cGreen;  // #A1E877

/// Returns the color of the White iPhone 5c.
+ (UIColor *)cWhite;  // #F5F4F7

/// Returns the color of the Yellow iPhone 5c.
+ (UIColor *)cYellow; // #FAF189

/// Returns the color of the Pink iPhone 5c.
+ (UIColor *)cPink;	  // #FE767A


#pragma mark - iPhone 5s Colors

/// Returns the color of the Space Gray iPhone 5s.
+ (UIColor *)sSpaceGray; // #99989B

/// Returns the color of the Gold iPhone 5s.
+ (UIColor *)sGold;      // #D7D9D8

/// Returns the color of the Silver iPhone 5s.
+ (UIColor *)sSilver;    // #D4C5B3


@end
