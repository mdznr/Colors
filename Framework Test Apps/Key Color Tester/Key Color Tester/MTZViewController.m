//
//  MTZViewController.m
//  Colors
//
//  Created by Matt Zanchelli on 9/2/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZViewController.h"

#import <Colors/Colors.h>
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
	
	CGFloat minContrast = 18.4f;
	// Generate data
	NSMutableDictionary *saturationPoints = [[NSMutableDictionary alloc] initWithCapacity:360];
	NSMutableDictionary *lightnessPoints = [[NSMutableDictionary alloc] initWithCapacity:360];
	// For every hue 0-360
	for ( CGFloat h=0; h<360; ++h ) {
		// Find first saturation that fufills requirements
		for ( CGFloat s=0; s<100; ++s ) {
			UIColor *color = [UIColor colorWithHue:h/360.0f
										saturation:s/100.0f
										brightness:1.0f
											 alpha:1.0f];
			CGFloat contrast = [UIColor differenceBetweenColor:color andColor:[UIColor colorWithRed:1.0f
																							  green:1.0f
																							   blue:1.0f
																							  alpha:1.0f]];
			
			if ( contrast > minContrast ) {
				[saturationPoints setValue:@(s) forKey:[NSString stringWithFormat:@"%03.0f", h]];
				break;
			}
		}
		// Find first lightness that fufills requirements
		for ( CGFloat l=0; l<100; ++l ) {
			UIColor *color = [UIColor colorWithHue:h/360.0f
										saturation:1.0
										brightness:l/100.0f
											 alpha:1.0f];
			CGFloat contrast = [UIColor differenceBetweenColor:color andColor:[UIColor colorWithRed:0.0f
																							  green:0.0f
																							   blue:0.0f
																							  alpha:1.0f]];
			if ( contrast > 2 * minContrast ) {
				[lightnessPoints setValue:@(l) forKey:[NSString stringWithFormat:@"%03.0f", h]];
				break;
			}
		}
	}
	
	NSLog(@"%@", saturationPoints);
	NSLog(@"%@", lightnessPoints);
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
	if ( _contrastSlider.value < 0.184f ) {
		_contrastLabel.textColor = [UIColor redColor];
	} else if ( _contrastSlider.value < .276f ) {
		_contrastLabel.textColor = [UIColor orangeColor];
	} else if ( _contrastSlider.value < .368f ) {
		_contrastLabel.textColor = [UIColor blackColor];
	} else {
		_contrastLabel.textColor = [UIColor greenColor];
	}
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
