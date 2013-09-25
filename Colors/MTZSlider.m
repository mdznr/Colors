//
//  MTZSlider.m
//  Colors
//
//  Created by Matt on 9/25/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZSlider.h"
#import "UIImage+TBTint.h"

@implementation MTZSlider

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
	[self setTintAdjustmentMode:UIViewTintAdjustmentModeAutomatic];
	[self setThumbImage:[UIImage imageNamed:@"Thumb"] forState:UIControlStateNormal];
	[self setTrackImages];
}

- (void)setTrackImages
{
	UIImage *track = [[UIImage imageNamed:@"Track"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 3, 0, 3)];
	[self setMaximumTrackImage:[track tintedImageWithColor:self.tintColor]
					  forState:UIControlStateNormal];
	
	UIImage *fill = [[UIImage imageNamed:@"Fill"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 3, 0, 3)];
    [self setMinimumTrackImage:[fill tintedImageWithColor:self.tintColor]
					  forState:UIControlStateNormal];
}

- (void)tintColorDidChange
{
	[super tintColorDidChange];
	[self setTrackImages];
}

@end
