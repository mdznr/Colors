//
//  UIColor+ColorFinder.h
//  Colors
//
//  Created by Matt on 10/29/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import UIKit;

@interface UIColor (ColorFinder)

/*
 Find a color in a set that is most like its receiver.
 */

/// Finds and returns the color in the set that is most like the receiver.
/// @param colors A set of colors to compare against the receiver.
/// @return a color object that is the most like the receiver.
- (UIColor *)mostSimilarColorInSet:(NSSet *)colors;

@end
