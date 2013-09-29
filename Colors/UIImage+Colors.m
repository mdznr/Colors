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

#pragma mark Background Color

- (UIColor *)backgroundColor
{
	return [self backgroundColorToContrastAgainstColors:nil
										   withContrast:0.0f];
}

- (UIColor *)backgroundColorToContrastAgainstColors:(NSArray *)colors
									   withContrast:(float)contast
{
	return [self colorToContrastAgainstColors:colors
								 withContrast:contast];
}


#pragma mark Key Color

- (UIColor *)keyColor
{
	return [self keyColorToContrastAgainstColors:@[[UIColor whiteColor],
												   [UIColor lightGrayColor],
												   [UIColor grayColor],
												   [UIColor darkGrayColor],
												   [UIColor blackColor]]
									withContrast:1.0f];
}

- (UIColor *)keyColorToContrastAgainstColors:(NSArray *)colors
								withContrast:(float)contrast
{
	return [self colorToContrastAgainstColors:colors
								 withContrast:contrast];
}


#pragma mark Color

- (UIColor *)colorToContrastAgainstColors:(NSArray *)colors
							 withContrast:(float)contrast
{
	NSDate *startDate = [NSDate date];
	float tolerance = contrast * 255.0f;
	
#warning determine a good size to get good color data (multiple of size)
	// Scale down image to make computation less intensive
	CGSize size = (CGSize){24,24};
	UIImage *smallImage = [self scaleToSize:size
				   withInterpolationQuality:kCGInterpolationLow];
	
	// Create an array for all the colors
	NSUInteger cap = smallImage.size.height * smallImage.size.width;
	NSMutableArray *imgColors = [[NSMutableArray alloc] initWithCapacity:cap];
	
	// Go through each pixel and add UIColor to array<
	unsigned char *pixelData = [smallImage rgbaPixels];
	for ( unsigned int x=0; x < smallImage.size.height; ++x ) {
		for ( unsigned int y=0; y < smallImage.size.width; ++y ) {
			unsigned char r = pixelData[(x*((int)smallImage.size.width)*4)+(y*4)];
			unsigned char g = pixelData[(x*((int)smallImage.size.width)*4)+(y*4)+1];
			unsigned char b = pixelData[(x*((int)smallImage.size.width)*4)+(y*4)+2];
			unsigned char a = pixelData[(x*((int)smallImage.size.width)*4)+(y*4)+3];
			UIColor *newColor = [UIColor colorWithRed:[[NSNumber numberWithUnsignedChar:r] floatValue]/255.0f
												green:[[NSNumber numberWithUnsignedChar:g] floatValue]/255.0f
												 blue:[[NSNumber numberWithUnsignedChar:b] floatValue]/255.0f
												alpha:[[NSNumber numberWithUnsignedChar:a] floatValue]/255.0f];
			
			// Make sure it contrasts enough with the desired color and has enough saturation
			BOOL failsToleranceTest = NO;
			for ( UIColor *color in colors ) {
				float distance = [UIColor euclideanDistanceFromColor:newColor
															   toColor:color];
//				NSLog(@"%f %f %f", distance, tolerance, distance/255.0f);
				if ( distance < tolerance ) {
//					NSLog(@"FAIL");
					failsToleranceTest = YES;
					break;
				}
			}
			if ( !failsToleranceTest ) {
//				NSLog(@"PASS");
				[imgColors addObject:newColor];
			}
		}
	}
	
	// Groups of colors
	NSMutableArray *groups = [[NSMutableArray alloc] initWithCapacity:4];
	
	// Iterate over every color and add it to a group
	for ( UIColor *eachColor in imgColors ) {
		NSMutableArray *bestFitGroup = nil;
		float smallestDistance = FLT_MAX;
		// Check every group and see if it fits in
		for ( NSMutableArray *group in groups ) {
			UIColor *groupColor = (UIColor *)[group objectAtIndex:0];
			float distance = [UIColor euclideanDistanceFromColor:eachColor
														 toColor:groupColor];
			if ( distance < smallestDistance ) {
				smallestDistance = distance;
				bestFitGroup = group;
			}
		}
		
		if ( smallestDistance < tolerance ) {
			// Add to group that had highest match
			[bestFitGroup addObject:eachColor];
		} else {
			// Or create a new group if not within tolerance
			NSMutableArray *newGroup = [[NSMutableArray alloc] initWithObjects:eachColor, nil];
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
		UIColor *groupColor = (UIColor *)[group objectAtIndex:0];
		NSLog(@"GROUP SIZE: %lu COLOR: %f %f %f",
			  (unsigned long)group.count,
			  [groupColor redComponent],
			  [groupColor greenComponent],
			  [groupColor blueComponent]);
	}
	NSLog(@"NUMGROUPS: %lu", (unsigned long)groups.count);
	
	// Get average color in dominant bucket
	NSMutableArray *group = groups[0];
	float r = 0.0f;
	float g = 0.0f;
	float b = 0.0f;
	for ( UIColor *eachColor in group ) {
		r += [eachColor redComponent];
		g += [eachColor greenComponent];
		b += [eachColor blueComponent];
	}
	r /= group.count;
	g /= group.count;
	b /= group.count;
	UIColor *returnColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
	
	NSLog(@"DURATION: %f", [[NSDate date] timeIntervalSinceDate:startDate]);
	
	NSLog(@"SAT: %f", returnColor.saturation);
	
	return returnColor;
}

@end
