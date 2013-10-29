//
//  UIColor+colorFinder.h
//  Colors
//
//  Created by Matt on 10/29/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (colorFinder)

- (UIColor *)mostSimilarColorInSet:(NSSet *)colors;

@end
