//
//  MTZViewController.m
//  Color from Image Speed Test
//
//  Created by Matt Zanchelli on 2/12/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZViewController.h"
#import <Colors/Colors.h>

@interface MTZViewController ()

@end

@implementation MTZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// These are all being done on the main thread.
	// The methods being tested are intended to be done on the main thread.
	// However, so many done sequentially in one thread is not intended, but is done for testing.
	NSDate *begin = [NSDate date];
	UIImage *image = [UIImage imageNamed:@"1"];
	UIColor *color = [image keyColorToContrastAgainstColors:@[[UIColor whiteColor]]
										withMinimumContrast:UIColorContrastLevelLow];
	NSDate *end = [NSDate date];
	NSLog(@"%f", [end timeIntervalSinceDate:begin]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
