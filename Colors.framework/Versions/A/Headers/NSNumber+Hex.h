//
//  NSNumber+Hex.h
//  Colors
//
//  Created by Matt on 9/2/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

@import Foundation;

@interface NSNumber (Hex)

/*
 Create and manage NSNumber objects using HEX values.
 */

/// Create a number from a string of hexadecimal characters
/// @param hexString A string containing hexadecimal characters
/// @return A newly instantiated @c NSNumber object from the hexadecimal string
+ (NSNumber *)numberWithHex:(NSString *)hexString;

/// Returns a string containing only hexadecimal characters representing the receiver.
/// @return A string containing only hexadecimal characters representing the receiver.
- (NSString *)hexString;

@end
