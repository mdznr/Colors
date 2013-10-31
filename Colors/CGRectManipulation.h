//
//  CGRectManipulation.h
//
//  Created by Matt Zanchelli on 9/23/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import Foundation;

/// Returns a rectangle with an origin that is offset from that of the source rectangle.
/// @param rect The source rectangle.
/// @param scale The scale value to multiply the dimensions of the rect.
/// @return A rectangle that is at the same origin as the source, but with its width and height multiplied by the scale.
CGRect CGRectScale(CGRect rect, CGFloat scale);
