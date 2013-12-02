//
//  CGRectManipulation.m
//
//  Created by Matt Zanchelli on 9/23/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "CGRectManipulation.h"

CGRect CGRectScale(CGRect rect, CGFloat scale) {
	return (CGRect){rect.origin.x    * scale,
		            rect.origin.y    * scale,
		            rect.size.width  * scale,
		            rect.size.height * scale};
}
