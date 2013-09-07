//
//  NSNumber+Hex.h
//  Colors
//
//  Created by Matt on 9/2/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Hex)

+ (NSNumber *)numberWithHex:(NSString *)hexString;

- (NSString *)hexString;

@end
