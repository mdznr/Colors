//
//  UIColor+DeviceColor.h
//  Colors
//
//  Created by Matt on 10/30/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DeviceColor)

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
