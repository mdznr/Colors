//
//  MTZViewController.m
//  Colors
//
//  Created by Matt Zanchelli on 9/2/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZViewController.h"

@import MediaPlayer;

#import "UIColor+ColorFinder.h"
#import "UIColor+Components.h"
#import "UIColor+Hex.h"
#import "UIColor+Manipulation.h"
#import "UIColor+NeueColors.h"
#import "MTZColorSpaceView.h"

@interface MTZViewController ()

@property (weak, nonatomic) IBOutlet MTZColorSpaceView *colorSpaceViewer;
@property (weak, nonatomic) IBOutlet UISlider *hueSlider;
@property (weak, nonatomic) IBOutlet UISlider *lightnessSlider;
@property (weak, nonatomic) IBOutlet UISlider *contrastSlider;

@property (weak, nonatomic) IBOutlet UILabel *hueLabel;
@property (weak, nonatomic) IBOutlet UILabel *lightnessLabel;
@property (weak, nonatomic) IBOutlet UILabel *contrastLabel;

@end

@implementation MTZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// Probably shouldn't do this, but it's just a test app
	[self sliderDidChange:_hueSlider];
	[self sliderDidChange:_lightnessSlider];
	[self sliderDidChange:_contrastSlider];
}

- (IBAction)sliderDidChange:(UISlider *)sender
{
	[self updateColors];
	
	if ( sender == _hueSlider ) {
		[_colorSpaceViewer setHue:_hueSlider.value];
	} else if ( sender == _lightnessSlider ) {
		[_colorSpaceViewer setLightness:_lightnessSlider.value];
	} else if ( sender == _contrastSlider ) {
		[_colorSpaceViewer setContrast:_contrastSlider.value];
	}
}

- (void)updateColors
{
	// Update Hue
	UIColor *hueColor = [UIColor colorWithHue:_hueSlider.value
								   saturation:1.0f
								   brightness:1.0f
										alpha:1.0f];
	_hueSlider.tintColor = hueColor;
	_hueLabel.textColor = hueColor;
	
	// Update Lightness
	UIColor *lightnessColor = [UIColor colorWithHue:0.0f
										 saturation:0.0f
										 brightness:(_lightnessSlider.value / 1.25)
											  alpha:1.0f];
	_lightnessSlider.tintColor = lightnessColor;
	_lightnessLabel.textColor = lightnessColor;
	
	// Update Contrast
	UIColor *contrastColor = [UIColor colorWithHue:0.0f
										 saturation:0.0f
										 brightness:.8 - (_contrastSlider.value / 1.25)
											  alpha:1.0f];
	_contrastSlider.tintColor = contrastColor;
	_contrastLabel.textColor = contrastColor;
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
