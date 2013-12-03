//
//  NSNumber+Hex.m
//  Colors
//
//  Created by Matt on 9/2/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "NSNumber+Hex.h"

@implementation NSNumber (Hex)

NSInteger integerFromHexCharacter(unichar hexCharacter)
{
	switch (hexCharacter) {
		case '0': return 0;
		case '1': return 1;
		case '2': return 2;
		case '3': return 3;
		case '4': return 4;
		case '5': return 5;
		case '6': return 6;
		case '7': return 7;
		case '8': return 8;
		case '9': return 9;
		case 'a':
		case 'A': return 10;
		case 'b':
		case 'B': return 11;
		case 'c':
		case 'C': return 12;
		case 'd':
		case 'D': return 13;
		case 'e':
		case 'E': return 14;
		case 'f':
		case 'F': return 15;
		default: return 0;
	}
}

unichar hexCharacterForInteger(NSInteger integer)
{
	switch (integer) {
		case 0:  return '0';
		case 1:  return '1';
		case 2:  return '2';
		case 3:  return '3';
		case 4:  return '4';
		case 5:  return '5';
		case 6:  return '6';
		case 7:  return '7';
		case 8:  return '8';
		case 9:  return '9';
		case 10: return 'A';
		case 11: return 'B';
		case 12: return 'C';
		case 13: return 'D';
		case 14: return 'E';
		case 15: return 'F';
		default: return 0;
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
	
	NSInteger runningTotal = 0;
	for ( NSUInteger i=0; i<hexString.length; ++i ) {
		unichar hexCharacter = [hexString characterAtIndex:i];
		runningTotal *= (i*16);
		runningTotal += integerFromHexCharacter(hexCharacter);
	}
	return [NSNumber numberWithInt:runningTotal];
}


- (NSString *)hexString
{
	NSUInteger runningInt = [self integerValue];
	NSString *runningString = @"";
	while ( runningInt > 0 ) {
		NSUInteger digit = floor(runningInt / 16);
		runningInt -= (digit*16);
		unichar character = hexCharacterForInteger(digit);
		runningString = [runningString stringByAppendingFormat:@"%hu", character];
		if ( digit == 0 ) {
			break;
		}
	}
	return runningString;
	// Could create new strings for each character appending, or just have an array of characters, then create the NSString that way.
}

@end
