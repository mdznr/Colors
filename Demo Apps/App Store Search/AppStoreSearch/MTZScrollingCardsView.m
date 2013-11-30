//
//  MTZScrollingCardsView.m
//  AppStoreSearch
//
//  Created by Matt Zanchelli on 11/18/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZScrollingCardsView.h"

@implementation MTZScrollingCardsView

- (id)init
{
	self = [super init];
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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self setup];
    }
    return self;
}

- (void)setup
{
	_scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
	_scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
	_scrollView.clipsToBounds = NO;
	_scrollView.scrollsToTop = NO;
	_scrollView.pagingEnabled = YES;
	_scrollView.showsHorizontalScrollIndicator = NO;
	_scrollView.showsVerticalScrollIndicator = NO;
	[self addSubview:_scrollView];
}

- (void)setWidth:(CGFloat)width
{
	_width = width;
	[self updateScrollViewSize];
}

- (void)setHeight:(CGFloat)height
{
	_height = height;
	[self updateScrollViewSize];
}

- (void)setPadding:(CGFloat)padding
{
	_padding = padding;
	[self updateScrollViewSize];
}

- (void)updateScrollViewSize
{
	_scrollView.frame = (CGRect){0, 0, _width + _padding, _height};
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
	if ( [self pointInside:point withEvent:event] ) {
		return _scrollView;
	}
	return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
