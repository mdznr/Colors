//
//  MTZSlider.h
//  Colors
//
//  Created by Matt on 9/25/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import UIKit;

@interface MTZSlider : UISlider

/**
 `MTZSlider` is a subclass of `UISlider` with modified artwork.
 */

///	The image to cover the filled area of the slider (the left side)
@property (strong, nonatomic) UIImage *fillImage;

///	The image to cover the unfilled area of the slider (the right side)
@property (strong, nonatomic) UIImage *trackImage;

@end
