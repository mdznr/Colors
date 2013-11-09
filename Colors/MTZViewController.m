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
#import "MTZKeyColorSpaceView.h"

@interface MTZViewController ()

@property (weak, nonatomic) IBOutlet MTZKeyColorSpaceView *colorSpaceViewer;
@property (weak, nonatomic) IBOutlet UISlider *hueSlider;

@property (weak, nonatomic) IBOutlet UILabel *hueLabel;

@end

@implementation MTZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// Probably shouldn't do this, but it's just a test app
	[self sliderDidChange:_hueSlider];
}

- (IBAction)sliderDidChange:(UISlider *)sender
{
	[self updateColors];
	
	if ( sender == _hueSlider ) {
		[_colorSpaceViewer setHue:_hueSlider.value];
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
