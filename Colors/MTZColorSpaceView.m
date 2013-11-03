//
//  MTZColorSpaceView.m
//  Colors
//
//  Created by Matt Zanchelli on 11/2/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZColorSpaceView.h"

@implementation MTZColorSpaceView

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

- (void)setLightness:(CGFloat)lightness
{
	_lightness = lightness;
	[self setNeedsDisplay];
}

- (void)setContrast:(CGFloat)contrast
{
	_contrast = contrast;
	[self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
	[super drawRect:rect];
	
    CGContextRef context = UIGraphicsGetCurrentContext();
	for ( NSUInteger x=rect.origin.x; x<rect.size.width; ++x ) {
		for ( NSUInteger y=rect.origin.y; y<rect.size.height; ++y ) {
			CGRect rectangle = CGRectMake(x, y, 1, 1);
			UIColor *color = [UIColor colorWithHue:_hue
										saturation:(x/(rect.size.width-rect.origin.x))
										brightness:1-(y/(rect.size.height-rect.origin.y))
											 alpha:1.0f];
			CGContextSetFillColorWithColor(context, color.CGColor);
			CGContextFillRect(context, rectangle);
		}
	}
}

@end
