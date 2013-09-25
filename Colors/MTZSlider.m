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
	[self setThumbImage:[UIImage imageNamed:@"Thumb"] forState:UIControlStateNormal];
	
	UIImage *track = [UIImage imageNamed:@"Track"];
	[self setMaximumTrackImage:[track resizableImageWithCapInsets:UIEdgeInsetsMake(0, 3, 0, 3)]
					  forState:UIControlStateNormal];
	
	[self setFillImage];
}

- (void)setFillImage
{
	UIImage *fill = [[UIImage imageNamed:@"Fill"] tintedImageWithColor:self.tintColor];
    [self setMinimumTrackImage:[fill resizableImageWithCapInsets:UIEdgeInsetsMake(0, 3, 0, 3)]
					  forState:UIControlStateNormal];
}

- (void)tintColorDidChange
{
	[super tintColorDidChange];
	[self setFillImage];
}

@end
