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

@property (weak, nonatomic) IBOutlet MTZColorSpaceView *colorSapceViewer;
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
	[self updateColors];
}

- (IBAction)sliderDidChange:(UISlider *)sender
{
	[self updateColors];
}

- (void)updateColors
{
	UIColor *hueColor = [UIColor colorWithHue:_hueSlider.value / 360.0f
								   saturation:1.0f
								   brightness:1.0f
										alpha:1.0f];
	_hueSlider.tintColor = hueColor;
	_hueLabel.textColor = hueColor;
	
	UIColor *lightnessColor = [UIColor colorWithHue:0.0f
										 saturation:0.0f
										 brightness:(_lightnessSlider.value / 1.25)
											  alpha:1.0f];
	_lightnessSlider.tintColor = lightnessColor;
	_lightnessLabel.textColor = lightnessColor;
	
	UIColor *contrastColor = [UIColor colorWithHue:0.0f
										 saturation:0.0f
										 brightness:.8 - (_contrastSlider.value / 125)
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
