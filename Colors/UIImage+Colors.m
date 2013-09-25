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

#import "UIColor+Components.h"
#import "UIColor+Manipulation.h"

@implementation UIImage (Colors)

- (UIColor *)backgroundColor
{
	// .1 different colors
	// .2 minimum different dominant colors
	// .5 for contrast
	CGFloat tolerance = 0.1f * 255.0f;
	
#warning determine a good size to get good color data (multiple of size)
	// Scale down image to make computation less intensive
	UIImage *smallImage = [self scaleToSize:(CGSize){32,32}];
	
	// Create an array for all the colors
	NSMutableArray *colors = [[NSMutableArray alloc] initWithCapacity:smallImage.size.height*smallImage.size.width];
	
	// Go through each pixel and add UIColor to array<
	unsigned char *pixelData = [smallImage rgbaPixels];
	for ( unsigned int x=0; x < smallImage.size.height; ++x ) {
		for ( unsigned int y=0; y < smallImage.size.width; ++y ) {
			unsigned char r = pixelData[(x*((int)smallImage.size.width)*4)+(y*4)];
			unsigned char g = pixelData[(x*((int)smallImage.size.width)*4)+(y*4)+1];
			unsigned char b = pixelData[(x*((int)smallImage.size.width)*4)+(y*4)+2];
			unsigned char a = pixelData[(x*((int)smallImage.size.width)*4)+(y*4)+3];
			UIColor *color = [UIColor colorWithRed:[[NSNumber numberWithUnsignedChar:r] floatValue]/255.0f
											 green:[[NSNumber numberWithUnsignedChar:g] floatValue]/255.0f
											  blue:[[NSNumber numberWithUnsignedChar:b] floatValue]/255.0f
											 alpha:[[NSNumber numberWithUnsignedChar:a] floatValue]/255.0f];
			NSLog(@"%f %f %f", [color redComponent], [color greenComponent], [color blueComponent]);
			[colors addObject:color];
		}
	}
	
	// Groups of colors
	NSMutableArray *groups = [[NSMutableArray alloc] initWithCapacity:4];
	
	// Iterate over every color and add it to a group
	for ( UIColor *color in colors ) {
#warning when to ignore unsaturated colors and when not to?
		// Only use saturated colors
		if ( color.saturation < 0.5f ) {
			continue;
		}
		NSMutableArray *bestFitGroup = nil;
		CGFloat smallestDistance = CGFLOAT_MAX;
		// Check every group and see if it fits in
		for ( NSMutableArray *group in groups ) {
			UIColor *groupColor = (UIColor *)[group objectAtIndex:0];
			CGFloat distance = [UIColor euclideanDistanceFromColor:color
														   toColor:groupColor];
			if ( distance < smallestDistance ) {
				smallestDistance = distance;
				bestFitGroup = group;
			}
		}
		
		// Add to group that had highest match
		if ( smallestDistance < tolerance ) {
			[bestFitGroup addObject:color];
		}
		// Or create a new group if not within tolerance
		else {
			NSMutableArray *newGroup = [[NSMutableArray alloc] initWithObjects:color, nil];
			[groups addObject:newGroup];
		}
	}
	
	// Sort groups of color in descending order of size
	[groups sortWithOptions:NSSortConcurrent
			usingComparator:^NSComparisonResult(id obj1, id obj2) {
				return ((NSArray *)obj1).count < ((NSArray *)obj2).count;
			}];
	
	// Print out the main color for each group
	NSLog(@"--");
	for ( NSMutableArray *group in groups ) {
		UIColor *color = (UIColor *)[group objectAtIndex:0];
		NSLog(@"%lu %f %f %f", (unsigned long)group.count, [color redComponent], [color greenComponent], [color blueComponent]);
	}
	NSLog(@"%lu", (unsigned long)groups.count);
	
	return groups[0][0];
}

- (UIColor *)foregroundColor
{
	return nil;
}

@end
