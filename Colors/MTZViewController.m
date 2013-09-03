//
//  MTZViewController.m
//  Colors
//
//  Created by Matt on 9/2/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZViewController.h"
#import "UIColor+NeueColors.h"

@interface MTZViewController ()

@end

@implementation MTZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	CGFloat height = (self.view.bounds.size.height/10);
	
	UIView *red = [[UIView alloc] initWithFrame:CGRectMake(0, 0*height, 320, height)];
	red.backgroundColor = UIColor.neueRed;
	[self.view addSubview:red];
	
	UIView *orange = [[UIView alloc] initWithFrame:CGRectMake(0, 1*height, 320, height)];
	orange.backgroundColor = UIColor.neueOrange;
	[self.view addSubview:orange];
	
	UIView *yellow = [[UIView alloc] initWithFrame:CGRectMake(0, 2*height, 320, height)];
	yellow.backgroundColor = UIColor.neueYellow;
	[self.view addSubview:yellow];
	
	UIView *green = [[UIView alloc] initWithFrame:CGRectMake(0, 3*height, 320, height)];
	green.backgroundColor = UIColor.neueGreen;
	[self.view addSubview:green];
	
	UIView *lb = [[UIView alloc] initWithFrame:CGRectMake(0, 4*height, 320, height)];
	lb.backgroundColor = UIColor.neueLightBlue;
	[self.view addSubview:lb];
	
	UIView *blue = [[UIView alloc] initWithFrame:CGRectMake(0, 5*height, 320, height)];
	blue.backgroundColor = UIColor.neueBlue;
	[self.view addSubview:blue];
	
	UIView *purple = [[UIView alloc] initWithFrame:CGRectMake(0, 6*height, 320, height)];
	purple.backgroundColor = UIColor.neuePurple;
	[self.view addSubview:purple];
	
	UIView *pink = [[UIView alloc] initWithFrame:CGRectMake(0, 7*height, 320, height)];
	pink.backgroundColor = UIColor.neuePink;
	[self.view addSubview:pink];
	
	UIView *dg = [[UIView alloc] initWithFrame:CGRectMake(0, 8*height, 320, height)];
	dg.backgroundColor = UIColor.neueDarkGray;
	[self.view addSubview:dg];
	
	UIView *lg = [[UIView alloc] initWithFrame:CGRectMake(0, 9*height, 320, height)];
	lg.backgroundColor = UIColor.neueLightGray;
	[self.view addSubview:lg];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
