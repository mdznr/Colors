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
	
	const int numberOfImages = 10;
	NSMutableArray *times = [NSMutableArray arrayWithCapacity:numberOfImages];
	
	// These are all being done on the main thread.
	// The methods being tested are intended to be done on the main thread.
	// However, so many done sequentially in one thread is not intended, but is done for testing.
	for ( int i=0; i<numberOfImages; ++i ) {
		NSString *imageName = [NSString stringWithFormat:@"%d", i];
		UIImage *image = [UIImage imageNamed:imageName];
		
		NSDate *begin = [NSDate date];
		UIColor *color = [image keyColorToContrastAgainstColors:@[[UIColor whiteColor]]
											withMinimumContrast:UIColorContrastLevelLow];
		NSTimeInterval time = [[NSDate date] timeIntervalSinceDate:begin];
		[times addObject:[NSNumber numberWithDouble:time]];
	}
	
	// Log all of the times.
	NSLog(@"%@", times);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
