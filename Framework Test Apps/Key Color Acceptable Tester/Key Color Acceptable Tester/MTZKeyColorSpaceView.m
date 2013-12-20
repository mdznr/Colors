//
//  MTZKeyColorSpaceView.m
//  Colors
//
//  Created by Matt Zanchelli on 11/8/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZKeyColorSpaceView.h"

#import <Colors/Colors.h>

#define SCALE 0.25f

@implementation MTZKeyColorSpaceView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setHue:(CGFloat)hue
{
	_hue = hue;
	[self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
	[super drawRect:rect];
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat width = ((rect.size.width)-(rect.origin.x));
	CGFloat height = ((rect.size.height)-(rect.origin.y));
	for ( CGFloat x=rect.origin.x; x<rect.size.width; x+=(1/SCALE) ) {
		for ( CGFloat y=rect.origin.y; y<rect.size.height; y+=(1/SCALE) ) {
			UIColor *color = [UIColor colorWithHue:_hue
										saturation:(x/width)
										brightness:1-(y/height)
											 alpha:1.0f];
			if ( [color isKeyColorAppropriate] ) {
				CGContextSetFillColorWithColor(context, color.CGColor);
			} else {
				CGContextSetRGBFillColor(context, 1.0f, 1.0f, 1.0f, 1.0f);
			}
			CGRect rectangle = CGRectMake(x, y, 1/SCALE, 1/SCALE);
			CGContextFillRect(context, rectangle);
		}
	}
}

@end
