//
//  UIColor+DeviceColor.h
//  Colors
//
//  Created by Matt on 10/30/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DeviceColor)

// TODO:
// Decide if there's a single source where a color can be determined. Perhaps abstracting to "primary" and "secondary" colors.

/*
 Get color information about the device, case, app icon, user wallpaper, and more.
 */

/// Returns the dominant color on the app's icon.
/// @return A newly instantiated color object representing the dominant color of the app's icon.
+ (UIColor *)appIconColor;

/// Returns the color of the device.
/// @return A newly instantiated color object representing the color of the device running the application.
+ (UIColor *)deviceColor;

/// Returns the color of the case on the device
/// @return A newly instantiated color object representing the color of the case the beautiful device is unfortunately covered with. Returns nil if no complying case is detected on the device.
#warning TODO: Write API to get notified of udpates of this property (like Dynamic Type)
+ (UIColor *)caseColor;

/// Returns the dominant color of the user's wallpaper.
/// @return A newly instantiated color object representing the dominant color of the user's wallpaper.
#warning TODO: Write API to get notified of udpates of this property (like Dynamic Type)
+ (UIColor *)userWallpaperColor;

@end


@interface UIApplication (DeviceColor)

/// Users may use different colored cases to personalise their devices. Users can expect the change in color of their case to be reflected in some areas across apps. Use the value of this property to request a color object of the color of the case.
/// When the value of this property changes, the app object sends a @c UICaseColorDidChangeNotification notification so that observers can respond accordingly.
@property (nonatomic, readonly) UIColor *caseColor;

/// Users may pick different colored wallpaper to personalise their devices. Users can expect the change in color of their wallpaper to be reflected in some areas across apps. Use the value of this property to request a color object of the color of the user's wallpaper.
/// When the value of this property changes, the app object sends a @c UIUserWallpaperColorDidChangeNotification notification so that observers can respond accordingly.
@property (nonatomic, readonly) UIColor *userWallpaperColor;

@end
