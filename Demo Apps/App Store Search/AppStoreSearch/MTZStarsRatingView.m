//
//  MTZStarsRatingView.m
//  AppStoreSearch
//
//  Created by Matt Zanchelli on 11/16/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZStarsRatingView.h"
#import <Colors/Colors.h>

static NSString *kStarImage = @"Star";
static NSString *kEmptyStarImage = @"EmptyStar";

@interface MTZStarsRatingView ()

@property (strong, nonatomic) UIImageView *starsImageView;
@property (strong, nonatomic) UIImageView *emptyStarsImageView;
@property (strong, nonatomic) UILabel *numberOfRatingsLabel;
@property (strong, nonatomic) NSNumberFormatter *numFormatter;

@end

@implementation MTZStarsRatingView

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
	// Hollow Stars
	_emptyStarsImageView = [[UIImageView alloc] initWithFrame:(CGRect){0, 0, 60, 12}];
	UIImage *emptyStarImage = [[UIImage imageNamed:kEmptyStarImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	_emptyStarsImageView.image = [emptyStarImage resizableImageWithCapInsets:UIEdgeInsetsZero
																resizingMode:UIImageResizingModeTile];
	[self addSubview:_emptyStarsImageView];
	
	// Filled Stars
	_starsImageView = [[UIImageView alloc] initWithFrame:(CGRect){0, 0, 12, 12}];
	UIImage *starImage = [[UIImage imageNamed:kStarImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	_starsImageView.image = [starImage resizableImageWithCapInsets:UIEdgeInsetsZero
													  resizingMode:UIImageResizingModeTile];
	[self addSubview:_starsImageView];
	
	// Number Formatter
	_numFormatter = [[NSNumberFormatter alloc] init];
	_numFormatter.numberStyle = NSNumberFormatterDecimalStyle;
	
	// Number of Ratings Label
	_numberOfRatingsLabel = [[UILabel alloc] initWithFrame:(CGRect){64,0,self.frame.size.width-64,12}];
	_numberOfRatingsLabel.font = [UIFont systemFontOfSize:10.0f];
	NSString *formattedNumber = [_numFormatter stringFromNumber:_numberOfRatings];
	_numberOfRatingsLabel.text = [NSString stringWithFormat:@"(%@)", formattedNumber];
	[self addSubview:_numberOfRatingsLabel];
}

- (void)setAverageUserRating:(NSNumber *)averageUserRating
{
	_averageUserRating = [NSNumber numberWithInt:MIN(MAX(0, averageUserRating.floatValue), 5)];
	
	_starsImageView.frame = (CGRect){0, 0, 12 * averageUserRating.floatValue, 12};
}

- (void)setNumberOfRatings:(NSNumber *)numberOfRatings
{
	_numberOfRatings = numberOfRatings;
	
	NSString *formattedNumber = [_numFormatter stringFromNumber:_numberOfRatings];
	_numberOfRatingsLabel.text = [NSString stringWithFormat:@"(%@)", formattedNumber];
}

@end
