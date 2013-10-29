//
//  MTZViewController.m
//  Colors
//
//  Created by Matt Zanchelli on 9/2/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZViewController.h"

#import "UIColor+Components.h"
#import "UIColor+Hex.h"
#import "UIColor+Manipulation.h"
#import "UIColor+NeueColors.h"
#import "UIImage+Colors.h"
#import "UIImage+Crop.h"

#import "MTZSlider.h"

#define DEBUG_MODE 0

@interface MTZViewController ()

@property (strong, nonatomic) IBOutlet UIView *color1Viewer;
@property (strong, nonatomic) IBOutlet UIView *color2ViewerSmall;

@property (strong, nonatomic) IBOutlet UIView *color2Viewer;
@property (strong, nonatomic) IBOutlet UIView *color1ViewerSmall;

@property (strong, nonatomic) IBOutlet UILabel *colorContrastLabel;

@property (strong, nonatomic) IBOutlet UISlider *rSlider1;
@property (strong, nonatomic) IBOutlet UISlider *gSlider1;
@property (strong, nonatomic) IBOutlet UISlider *bSlider1;

@property (strong, nonatomic) IBOutlet UISlider *rSlider2;
@property (strong, nonatomic) IBOutlet UISlider *gSlider2;
@property (strong, nonatomic) IBOutlet UISlider *bSlider2;

@end

@implementation MTZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sliderValueChanged:(id)sender
{
	[self refreshColors];
}

- (void)refreshColors
{
	UIColor *color1 = [UIColor colorWithRed:_rSlider1.value/255.0f
									  green:_gSlider1.value/255.0f
									   blue:_bSlider1.value/255.0f
									  alpha:1.0f];
	_color1Viewer.backgroundColor = color1;
	_color1ViewerSmall.backgroundColor = color1;
	_rSlider1.tintColor = color1;
	_gSlider1.tintColor = color1;
	_bSlider1.tintColor = color1;
	
	UIColor *color2 = [UIColor colorWithRed:_rSlider2.value/255.0f
									  green:_gSlider2.value/255.0f
									   blue:_bSlider2.value/255.0f
									  alpha:1.0f];
	_color2Viewer.backgroundColor = color2;
	_color2ViewerSmall.backgroundColor = color2;
	_rSlider2.tintColor = color2;
	_gSlider2.tintColor = color2;
	_bSlider2.tintColor = color2;
	
	CGFloat difference = [UIColor euclideanDistanceFromColor:color1
													 toColor:color2];
	_colorContrastLabel.text = [NSString stringWithFormat:@"%f", difference];
}

#pragma mark View Controller end

- (void)dealloc
{
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
