//
//  MTZOutlinedButton.m
//
//  Created by Matt Zanchelli on 9/16/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZOutlinedButton.h"

#define DEFAULT_THICKNESS 1.0f

@interface MTZOutlinedButton ()

@property (nonatomic) CGFloat borderWidth;

@end


@implementation MTZOutlinedButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self setup];
	}
	return self;
}

- (id)init
{
	self = [super init];
	if (self) {
		[self setup];
	}
	return self;
}

- (void)setup
{
	// Setting up some defaults
	_borderWidth = DEFAULT_THICKNESS;
	_cornerRadius = 8.0f;
}

- (void)setTintColor:(UIColor *)normalColor
{
	[super setTintColor:normalColor];
}

- (void)tintColorDidChange
{
	[super tintColorDidChange];
	[self setNeedsDisplay];
}

- (void)setHighlighted:(BOOL)highlighted
{
	[super setHighlighted:highlighted];
	if ( highlighted ) {
	} else {
	}
}

- (void)drawRect:(CGRect)rect
{
	[super drawRect:rect];
	
	CGRect innerRect = CGRectInset(rect, self.borderWidth/2, self.borderWidth/2);
	UIBezierPath *bp = [UIBezierPath bezierPathWithRoundedRect:innerRect
												  cornerRadius:self.cornerRadius];
	bp.lineWidth = self.borderWidth;
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextAddPath(ctx, bp.CGPath);
	CGContextSetFillColorWithColor(ctx, self.tintColor.CGColor);
	CGContextSetStrokeColorWithColor(ctx, self.tintColor.CGColor);
	CGContextSetLineWidth(ctx, self.borderWidth);
	CGContextDrawPath(ctx, kCGPathStroke);
}

@end
