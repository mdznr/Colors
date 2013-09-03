//
//  NSNumber+Hex.m
//  Colors
//
//  Created by Matt on 9/2/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "NSNumber+Hex.h"

@implementation NSNumber (Hex)

NSUInteger integerFromHexCharacter(unichar hexCharacter)
{
	switch (hexCharacter) {
		case '0':
			return 0;
			break;
		case '1':
			return 1;
			break;
		case '2':
			return 2;
			break;
		case '3':
			return 3;
			break;
		case '4':
			return 4;
			break;
		case '5':
			return 5;
			break;
		case '6':
			return 6;
			break;
		case '7':
			return 7;
			break;
		case '8':
			return 8;
			break;
		case '9':
			return 9;
			break;
		case 'a':
		case 'A':
			return 10;
			break;
		case 'b':
		case 'B':
			return 11;
			break;
		case 'c':
		case 'C':
			return 12;
			break;
		case 'd':
		case 'D':
			return 13;
			break;
		case 'e':
		case 'E':
			return 14;
			break;
		case 'f':
		case 'F':
			return 15;
			break;
		default:
			return 0;
			break;
	}
}

+ (NSNumber *)numberWithHex:(NSString *)hexString
{
	NSString *hexRegexString = @"^[0-9a-f]+$";
	NSError *error = NULL;
	NSRegularExpression *hexRegex = [NSRegularExpression regularExpressionWithPattern:hexRegexString
																			  options:NSRegularExpressionCaseInsensitive
																				error:&error];
	if ( error ) {
		NSLog(@"Error: There was an error creating regular expression for hex colors");
		return nil;
	}
	
	NSUInteger numberOfMatches = [hexRegex numberOfMatchesInString:hexString
														   options:NSMatchingReportCompletion
															 range:NSMakeRange(0, hexString.length)];
	if ( numberOfMatches != 1 ) {
		NSLog(@"Error: '%@' is not a valid hexadecimal string", hexString);
		return nil;
	}
	
	NSUInteger runningTotal = 0;
	for ( NSUInteger i=0; i<hexString.length; ++i ) {
		unichar hexCharacter = [hexString characterAtIndex:i];
		runningTotal *= (i*16);
		runningTotal += integerFromHexCharacter(hexCharacter);
	}
	return [NSNumber numberWithUnsignedInteger:runningTotal];
}

@end
