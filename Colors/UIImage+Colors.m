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
	return nil;
}

- (UIColor *)foregroundColor
{
	return nil;
}

- (UIColor *)keyColor
{
	return [self keyColorToContrastAgainstColor:[UIColor whiteColor]
								   withContrast:0.2f];
}

- (UIColor *)keyColorToContrastAgainstColor:(UIColor *)color
							   withContrast:(CGFloat)contrast
{
	NSDate *startDate = [NSDate date];
	CGFloat tolerance = contrast * 255.0f;
	
#warning determine a good size to get good color data (multiple of size)
#warning determine proper interpolation quality for level of detail of image (lower quality for higher detail)
	// Scale down image to make computation less intensive
	CGSize size = (CGSize){24,24};
	UIImage *smallImage = [self scaleToSize:size
				   withInterpolationQuality:kCGInterpolationLow];
	
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
			//NSLog(@"%f %f %f", [color redComponent], [color greenComponent], [color blueComponent]);
			[colors addObject:color];
		}
	}
	
	// Groups of colors
	NSMutableArray *groups = [[NSMutableArray alloc] initWithCapacity:4];
	
	// Iterate over every color and add it to a group
	for ( UIColor *myColor in colors ) {
		// Make sure it contrasts enough with the desired color
		if ( [UIColor euclideanDistanceFromColor:color
										 toColor:myColor] < tolerance ) {
			continue;
		}
		
#warning when to ignore unsaturated colors and when not to?
		// Only use saturated colors
		if ( myColor.saturation < 0.25f ) {
//			continue;
		}
		
		NSMutableArray *bestFitGroup = nil;
		CGFloat smallestDistance = CGFLOAT_MAX;
		// Check every group and see if it fits in
		for ( NSMutableArray *group in groups ) {
			UIColor *groupColor = (UIColor *)[group objectAtIndex:0];
			CGFloat distance = [UIColor euclideanDistanceFromColor:myColor
														   toColor:groupColor];
			if ( distance < smallestDistance ) {
				smallestDistance = distance;
				bestFitGroup = group;
			}
		}
		
		// Add to group that had highest match
		if ( smallestDistance < tolerance ) {
			[bestFitGroup addObject:myColor];
		}
		// Or create a new group if not within tolerance
		else {
			NSMutableArray *newGroup = [[NSMutableArray alloc] initWithObjects:myColor, nil];
			[groups addObject:newGroup];
		}
	}
	
	// Return nil if there aren't any buckets.
	if ( !groups.count ) return nil;
	
	// Sort groups of color in descending order of size
	[groups sortWithOptions:NSSortConcurrent
			usingComparator:^NSComparisonResult(id obj1, id obj2) {
				return ((NSArray *)obj1).count < ((NSArray *)obj2).count;
			}];
	
	// Print out the main color for each group
	for ( NSMutableArray *group in groups ) {
		UIColor *color = (UIColor *)[group objectAtIndex:0];
		NSLog(@"GROUP SIZE: %lu COLOR: %f %f %f", (unsigned long)group.count, [color redComponent], [color greenComponent], [color blueComponent]);
	}
	NSLog(@"NUMGROUPS: %lu", (unsigned long)groups.count);
	
	// Get average color in dominant bucket
	NSMutableArray *group = groups[0];
	CGFloat r = 0.0f;
	CGFloat g = 0.0f;
	CGFloat b = 0.0f;
	for ( UIColor *color in group ) {
		r += [color redComponent];
		g += [color greenComponent];
		b += [color blueComponent];
	}
	r /= group.count;
	g /= group.count;
	b /= group.count;
	NSLog(@"DURATION: %f", [[NSDate date] timeIntervalSinceDate:startDate]);
	return [UIColor colorWithRed:r
						   green:g
							blue:b
						   alpha:1.0f];
}

@end
