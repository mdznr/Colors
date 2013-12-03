//
//  UIColor+DeviceColor.m
//  Colors
//
//  Created by Matt on 10/30/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "UIColor+DeviceColor.h"
#import "UIColor+NeueColors.h"

@implementation UIColor (DeviceColor)

+ (UIColor *)appIconColor
{
#warning TODO: Implement
	return nil;
}

+ (UIColor *)deviceColor
{
#warning TODO: Implement
	return nil;
}

+ (UIColor *)caseColor
{
#warning TODO: Implement
	/*
	 How this would work:
	 A case can broadcast it's color to the device using NFC or something similar. This method will ask iOS for that color. The OS can make things more efficient by storing the color locally and updating that value whenever a change in case is detected. The OS can also notify apps that are watching for updates on this color.
	 */
	return nil;
}

+ (UIColor *)userWallpaperColor
{
#warning TODO: Implement
	return nil;
}

@end
