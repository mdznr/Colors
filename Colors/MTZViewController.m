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

#define DEBUG_MODE 0

@interface MTZViewController ()

@property (strong, nonatomic) IBOutlet UIView *inputColorViewer;
@property (strong, nonatomic) IBOutlet UIView *outputColorViewer;

@property (strong, nonatomic) IBOutlet UISlider *rSlider;
@property (strong, nonatomic) IBOutlet UISlider *gSlider;
@property (strong, nonatomic) IBOutlet UISlider *bSlider;

@property (strong, nonatomic) IBOutlet UITextField *inputRValue;
@property (strong, nonatomic) IBOutlet UITextField *inputGValue;
@property (strong, nonatomic) IBOutlet UITextField *inputBValue;

@property (strong, nonatomic) IBOutlet UITextField *outputRValue;
@property (strong, nonatomic) IBOutlet UITextField *outputGValue;
@property (strong, nonatomic) IBOutlet UITextField *outputBValue;

@end

@implementation MTZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sliderValueChanged:(id)sender
{
	[self refreshColorsWithRed:_rSlider.value
						 green:_gSlider.value
						  blue:_bSlider.value];
}

// Expects RGB values from 0-255
- (void)refreshColorsWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b
{
	// Refresh colors in direct (input) views
	UIColor *inputColor = [UIColor colorWithRed:r/255.0f
										  green:g/255.0f
										   blue:b/255.0f
										  alpha:1.0f];
	_inputColorViewer.backgroundColor = inputColor;
	_inputRValue.text = [NSString stringWithFormat:@"%.0f", r];
	_inputGValue.text = [NSString stringWithFormat:@"%.0f", g];
	_inputBValue.text = [NSString stringWithFormat:@"%.0f", b];
	
	// Convert to new colorspace
	CGFloat labL = [inputColor lValue];
	CGFloat labA = [inputColor aValue];
	CGFloat labB = [inputColor bValue];
	
	// Convert back to RGB
	UIColor *outputColor = [UIColor colorWithLabL:labL a:labA b:labB];
	
	// Refresh colors in indirect (output) views
	_outputColorViewer.backgroundColor = outputColor;
	_outputRValue.text = [NSString stringWithFormat:@"%.0f", [outputColor redComponent] * 255];
	_outputGValue.text = [NSString stringWithFormat:@"%.0f", [outputColor greenComponent] * 255];
	_outputBValue.text = [NSString stringWithFormat:@"%.0f", [outputColor blueComponent] * 255];
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
