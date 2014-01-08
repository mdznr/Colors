//
//  ThemeColor.m
//  Colors
//
//  Created by Matt on 10/30/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "ThemeColor.h"

#import "UIColor+NeueColors.h"

// TODO:
// Post notifications on change

@implementation UIApplication (ThemeColor)

UIColor *_appIconColor, *_userWallpaperColor;

- (UIColor *)appIconColor
{
	if ( !_appIconColor ) {
		// TODO: Implement appIconColor
		_appIconColor = nil;
	}
	return _appIconColor;
}

- (UIColor *)userWallpaperColor
{
	if ( !_userWallpaperColor ) {
		// TODO: Implement userWallpaperColor
		_userWallpaperColor = nil;
	}
	return _userWallpaperColor;
}

@end


@implementation UIDevice (ThemeColor)

UIColor *_caseColor, *_deviceColor;

- (UIColor *)caseColor
{
	if ( !_caseColor ) {
		// TODO: Implement caseColor
		_caseColor = nil;
	}
	return _caseColor;
}

- (UIColor *)deviceColor
{
	if ( !_deviceColor ) {
		// TODO: Implement deviceColor
		_deviceColor = nil;
	}
	return _deviceColor;
}

@end

