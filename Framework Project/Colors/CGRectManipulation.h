//
//  CGRectManipulation.h
//
//  Created by Matt Zanchelli on 9/23/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import UIKit;

/*
 Advanced manipulation of CGRect structs
 */

/// Returns a rectangle with an origin that is offset from that of the source rectangle.
/// @param rect The source rectangle.
/// @param scale The scale value to multiply the origin and dimensions of the rect.
/// @discussion Both the origin and dimensions are multiplied by the scale
/// @return A rectangle that has been scaled by a multiplier.
CGRect CGRectScale(CGRect rect, CGFloat scale);
