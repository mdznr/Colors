//
//  ThemeColor.h
//  Colors
//
//  Created by Matt on 10/30/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

// TODO:
// Decide if there's a single source where a proper theme color can be determined. Perhaps abstract to "primary" and "secondary" colors.

/*
 Get color information about the device, case, app icon, user wallpaper, and more.
 */

@interface UIApplication (ThemeColor)

/// Use the value of this property to request a color object of the primary color of the application's icon.
@property (nonatomic, readonly) UIColor *appIconColor;

/// Users may pick different colored wallpaper to personalise their devices. Users can expect the change in color of their wallpaper to be reflected in some areas across apps. Use the value of this property to request a color object of the color of the user's wallpaper.
/// When the value of this property changes, the app object sends a @c UIUserWallpaperColorDidChangeNotification notification so that observers can respond accordingly.
@property (nonatomic, readonly) UIColor *userWallpaperColor;

@end


@interface UIDevice (ThemeColor)

/// The color of the case on the device.
/// Users may use different colored cases to personalise their devices. Users can expect the change in color of their case to be reflected in some areas across apps. Use the value of this property to request a color object of the color of the case.
/// When the value of this property changes, the app object sends a @c UIDeviceCaseColorDidChangeNotification notification so that observers can respond accordingly.
/// @discussion Only compliant cases will work
@property (nonatomic, readonly) UIColor *caseColor;

/// The color of the device.
/// Use the value of this property to request a color object of the color of the device.
/// One potential use for this is to show primarily dark or primarily light content by default.
@property (nonatomic, readonly) UIColor *deviceColor;

@end
