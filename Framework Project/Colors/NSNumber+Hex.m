//
//  NSNumber+Hex.m
//  Colors
//
//  Created by Matt on 9/2/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "NSNumber+Hex.h"

@implementation NSNumber (Hex)

// Implementation from René Puls
// http://lists.apple.com/archives/Cocoa-dev/2005/Jan/msg01253.html
+ (NSNumber *)numberWithHex:(NSString *)hexString
{
	unsigned int tempInt;
	NSScanner *scanner = [NSScanner scannerWithString:hexString];
	if ( ![scanner scanHexInt:&tempInt] ) {
		NSLog(@"Error: Unable to read hex string.");
		return nil;
	}
	return [NSNumber numberWithInt:tempInt];
}

// Implementation from René Puls
// http://lists.apple.com/archives/Cocoa-dev/2005/Jan/msg01253.html
- (NSString *)hexString
{
	return [NSString stringWithFormat:@"0x%x", [self intValue]];
}

@end
