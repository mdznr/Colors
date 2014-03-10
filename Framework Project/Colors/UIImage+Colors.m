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
#import "UIColor+KeyColor.h"
#import "UIColor+Manipulation.h"

@implementation UIImage (Colors)

CGFloat getContrastLevel(UIColorContrast contrast)
{
	// Values based off of "Just noticeable difference" of 2.3. Value determined by Mahy et al. (1994)
	CGFloat JND = 2.3f;
	switch ( contrast ) {
		case UIColorContrastLevelLow:    return JND * 8;
		case UIColorContrastLevelMedium: return JND * 16;
		case UIColorContrastLevelHigh:   return JND * 24;
		default: return 0.0f;
	}
}

#pragma mark - Background Color

- (UIColor *)backgroundColor
{
	// TODO: Use system preference for color contrast level
	return [self backgroundColorToContrastAgainstColors:nil
									withMinimumContrast:0.0f];
}

- (UIColor *)backgroundColorToContrastAgainstColors:(NSArray *)colors
								withMinimumContrast:(UIColorContrast)requiredMinimumContrast
{
	requiredMinimumContrast = getContrastLevel(requiredMinimumContrast);
	return [self colorToContrastAgainstColors:colors
						  withMinimumContrast:requiredMinimumContrast
							 forUseAsKeyColor:NO];
}


#pragma mark - Key Color

- (UIColor *)keyColor
{
	// TODO: Use system preference for color contrast level
	return [self keyColorToContrastAgainstColors:nil
							 withMinimumContrast:0.0f];
}

- (UIColor *)keyColorToContrastAgainstColors:(NSArray *)colors
						 withMinimumContrast:(UIColorContrast)requiredMinimumContrast
{
	requiredMinimumContrast = getContrastLevel(requiredMinimumContrast);
	return [self colorToContrastAgainstColors:colors
						  withMinimumContrast:requiredMinimumContrast
							 forUseAsKeyColor:YES];
}


#pragma mark - Color

- (UIColor *)colorToContrastAgainstColors:(NSArray *)colors
					  withMinimumContrast:(CGFloat)requiredMinimumContrast
						 forUseAsKeyColor:(BOOL)keyColor
{
	// TODO: Determine a good size to get good color data (multiple of size?)
	
	// Scale down image to make computation less intensive
	CGSize size = CGSizeMake(16, 16);
	UIImage *smallImage = [self scaleToSize:size
				   withInterpolationQuality:kCGInterpolationLow];
	
	// Create an array for all the colors
	NSUInteger cap = size.height * size.width;
	
	// Groups of colors
	NSMutableArray *groups = [[NSMutableArray alloc] initWithCapacity:4];
	
	// Filter possible colors
	unsigned char *pixelData = [smallImage rgbaPixels];
	for ( unsigned int x=0; x < size.height; ++x ) {
		for ( unsigned int y=0; y < size.width; ++y ) {
			unsigned char r = pixelData[(x*((int)size.width)*4)+(y*4)];
			unsigned char g = pixelData[(x*((int)size.width)*4)+(y*4)+1];
			unsigned char b = pixelData[(x*((int)size.width)*4)+(y*4)+2];
			unsigned char a = pixelData[(x*((int)size.width)*4)+(y*4)+3];
			
			// TODO: Use struct or minimal class?
			// po (size_t) class_getInstanceSize ([UIImage class]);
			// 72
			// po po (size_t) 3 * sizeof(CGFloat)
			// 24
			// Potential struct is 1/3 the memory.
			
			UIColor *newColor = [UIColor colorWithRed:[[NSNumber numberWithUnsignedChar:r] floatValue]/255.0f
												green:[[NSNumber numberWithUnsignedChar:g] floatValue]/255.0f
												 blue:[[NSNumber numberWithUnsignedChar:b] floatValue]/255.0f
												alpha:[[NSNumber numberWithUnsignedChar:a] floatValue]/255.0f];
			
			// Make sure it is a key color, if desired
			// Checks for required brightness and saturation levels
			if ( keyColor && ![newColor isKeyColorAppropriate] ) {
				continue;
			}
			
			// Make sure it contrasts enough with the desired color and has enough saturation
			BOOL failsTest = NO;
			for ( UIColor *color in colors ) {
				CGFloat distance = [UIColor differenceBetweenColor:newColor
														  andColor:color];
				if ( distance < requiredMinimumContrast ) {
					failsTest = YES;
					break;
				}
			}
			
			// Assign color to a group.
			if ( !failsTest ) {
				NSMutableArray *bestFitGroup = nil;
				CGFloat smallestDistance = CGFLOAT_MAX;
				// Check every group and see if it fits in
				for ( NSMutableArray *group in groups ) {
					UIColor *groupColor = (UIColor *)[group objectAtIndex:0];
					CGFloat distance = [UIColor differenceBetweenColor:newColor
															  andColor:groupColor];
					if ( distance < smallestDistance ) {
						smallestDistance = distance;
						bestFitGroup = group;
					}
				}
				
				if ( smallestDistance < requiredMinimumContrast ) {
					// Add to group that had highest match
					[bestFitGroup addObject:newColor];
				} else {
					// Or create a new group if not within tolerance
					NSMutableArray *newGroup = [[NSMutableArray alloc] initWithObjects:newColor, nil];
					[groups addObject:newGroup];
				}
			}
		}
	}
	
	// Return nil if there aren't any buckets.
	if ( !groups.count ) return nil;
	
	// Sort groups of color in descending order of size
	[groups sortWithOptions:NSSortConcurrent
			usingComparator:^NSComparisonResult(id obj1, id obj2) {
				return ((NSArray *)obj1).count < ((NSArray *)obj2).count;
			}];
	
	// Get average color in dominant bucket
	NSMutableArray *group = groups[0];
	CGFloat L = 0.0f;
	CGFloat a = 0.0f;
	CGFloat b = 0.0f;
	for ( UIColor *eachColor in group ) {
		L += [eachColor CIELab_LValue];
		a += [eachColor CIELab_aValue];
		b += [eachColor CIELab_bValue];
	}
	L /= group.count;
	a /= group.count;
	b /= group.count;
	UIColor *returnColor = [UIColor colorWithCIELabL:L a:a b:b];
	
	return returnColor;
}

@end
