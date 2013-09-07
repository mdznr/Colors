//
//  UIColor+Components.m
//  Colors
//
//  Created by Matt on 9/3/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "UIColor+Components.h"

@implementation UIColor (Components)

#pragma mark - RGB

- (CGFloat)redComponent
{
	return self.CIColor.red;
}

- (CGFloat)greenComponent
{
	return self.CIColor.green;
}

- (CGFloat)blueComponent
{
	return self.CIColor.blue;
}


#pragma mark - CMYK

- (CGFloat)cyanComponent
{
#warning TODO
	return 0;
}

- (CGFloat)magentaComponent
{
#warning TODO
	return 0;
}

- (CGFloat)yellowComponent
{
#warning TODO
	return 0;
}

- (CGFloat)blackComponent
{
#warning TODO
	return 0;
}

#pragma mark - HSB

- (CGFloat)hue
{
#warning TODO
	return 0;
	
}

- (CGFloat)saturation
{
#warning TODO
	return 0;
}

- (CGFloat)brightness
{
#warning TODO
	return 0;
}

@end
