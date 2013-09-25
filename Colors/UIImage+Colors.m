//
//  UIImage+Colors.m
//  Colors
//
//  Created by Matt Zanchelli on 9/24/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "UIImage+Colors.h"
#import "UIImage+Crop.h"
#import "UIImage+Pixels.h"

@implementation UIImage (Colors)

- (UIColor *)backgroundColor
{
	return nil;
}

- (UIColor *)foregroundColor
{
	unsigned char *pixelData = [self rgbaPixels];
	
	unsigned int count = 0;
	for ( int x=0; x < self.size.height; ++x ) {
		for ( int y=0; y < self.size.width; ++y ) {
			unsigned char r = pixelData[(x*((int)self.size.width)*4)+(y*4)];
			unsigned char g = pixelData[(x*((int)self.size.width)*4)+(y*4)+1];
			unsigned char b = pixelData[(x*((int)self.size.width)*4)+(y*4)+2];
			unsigned char a = pixelData[(x*((int)self.size.width)*4)+(y*4)+3];
//			NSLog(@"r = 0x%X g = 0x%X b = 0x%X a = 0x%X",r,g,b,a);
			count++;
		}
	}
	NSLog(@"%u", count);
	
	return nil;
}

@end
