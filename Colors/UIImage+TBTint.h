//
//  UIImage+TBTint.h
//  Blender
//
//  Created by Gordon Fontenot on 3/29/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

@interface UIImage (TBTint)

- (UIImage *)tintedGradientImageWithColor:(UIColor *)tintColor;
- (UIImage *)tintedImageWithColor:(UIColor *)tintColor;

@end
