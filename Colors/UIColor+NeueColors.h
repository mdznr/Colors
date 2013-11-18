//
//  UIColor+NeueColors.h
//  Colors
//
//  Created by Matt on 9/2/13. 
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import UIKit;

@interface UIColor (NeueColors)

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
+ (UIColor *)neueRed;

/// Returns the standard system color for orange.
+ (UIColor *)neueOrange;

/// Returns the standard system color for yellow.
+ (UIColor *)neueYellow;

/// Returns the standard system color for green.
+ (UIColor *)neueGreen;

/// Returns the standard system color for light blue.
+ (UIColor *)neueLightBlue;

/// Returns the standard system color for blue.
+ (UIColor *)neueBlue;

/// Returns the standard system color for purple.
+ (UIColor *)neuePurple;

/// Returns the standard system color for pink.
+ (UIColor *)neuePink;

/// Returns the standard system color for dark gray.
+ (UIColor *)neueGray;

/// Returns the standard system color for light gray.
+ (UIColor *)neueLightGray;


#pragma mark - iPhone 5c Colors

/// Returns the color of the Blue iPhone 5c.
+ (UIColor *)cBlue;

/// Returns the color of the Green iPhone 5c.
+ (UIColor *)cGreen;

/// Returns the color of the White iPhone 5c.
+ (UIColor *)cWhite;

/// Returns the color of the Yellow iPhone 5c.
+ (UIColor *)cYellow;

/// Returns the color of the Pink iPhone 5c.
+ (UIColor *)cPink;


#pragma mark - iPhone 5s Colors

/// Returns the color of the Space Gray iPhone 5s.
+ (UIColor *)sSpaceGray;

/// Returns the color of the Gold iPhone 5s.
+ (UIColor *)sGold;

/// Returns the color of the Silver iPhone 5s.
+ (UIColor *)sSilver;


@end
