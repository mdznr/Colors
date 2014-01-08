/*
 * Copyright (c) 2011 b2cloud
 * By Will Sackfield
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for specific language governing permissions and
 * limitations under the License.
 *
 * File: UIImage+Pixels.m
 *
 * 1.0 (23/08/2011)
 */

#import "UIImage+Pixels.h"

@implementation UIImage (Pixels)

- (unsigned char *)grayscalePixels
{
	// The amount of bits per pixel, in this case we are doing grayscale so 1 byte = 8 bits
	#define BITS_PER_PIXEL 8
	// The amount of bits per component, in this it is the same as the bitsPerPixel because only 1 byte represents a pixel
	#define BITS_PER_COMPONENT (BITS_PER_PIXEL)
	// The amount of bytes per pixel, not really sure why it asks for this as well but it's basically the bitsPerPixel divided by the bits per component (making 1 in this case)
	#define BYTES_PER_PIXEL (BITS_PER_PIXEL/BITS_PER_COMPONENT)
	
	// Define the colour space (in this case it's gray)
	CGColorSpaceRef colourSpace = CGColorSpaceCreateDeviceGray();
	
	// Find out the number of bytes per row (it's just the width times the number of bytes per pixel)
	size_t bytesPerRow = self.size.width * BYTES_PER_PIXEL;
	// Allocate the appropriate amount of memory to hold the bitmap context
	unsigned char* bitmapData = (unsigned char *) malloc(bytesPerRow * self.size.height);
	
	// Create the bitmap context, we set the alpha to none here to tell the bitmap we don't care about alpha values
	CGContextRef context = CGBitmapContextCreate(bitmapData, self.size.width, self.size.height, BITS_PER_COMPONENT, bytesPerRow, colourSpace, (CGBitmapInfo) kCGImageAlphaNone);
	
	// Release the bitmap data because we are done using it
	free(bitmapData);
	
	// We are done with the colour space now so no point in keeping it around
	CGColorSpaceRelease(colourSpace);
	
	// Create a CGRect to define the amount of pixels we want
	CGRect rect = CGRectMake(0.0, 0.0, self.size.width, self.size.height);
	// Draw the bitmap context using the rectangle we just created as a bounds and the Core Graphics Image as the image source
	CGContextDrawImage(context, rect, self.CGImage);
	// Obtain the pixel data from the bitmap context
	unsigned char* pixelData = (unsigned char *) CGBitmapContextGetData(context);
	
	// Release the bitmap context because we are done using it
	CGContextRelease(context);
	
	return pixelData;
	#undef BITS_PER_PIXEL
	#undef BITS_PER_COMPONENT
}

- (unsigned char *)rgbaPixels
{
	// The amount of bits per pixel, in this case we are doing RGBA so 4 byte = 32 bits
	#define BITS_PER_PIXEL 32
	// The amount of bits per component, in this it is the same as the bitsPerPixel divided by 4 because each component (such as Red) is only 8 bits
	#define BITS_PER_COMPONENT (BITS_PER_PIXEL/4)
	// The amount of bytes per pixel, in this case a pixel is made up of Red, Green, Blue and Alpha so it will be 4
	#define BYTES_PER_PIXEL (BITS_PER_PIXEL/BITS_PER_COMPONENT)
	
	// Define the colour space (in this case it's gray)
	CGColorSpaceRef colourSpace = CGColorSpaceCreateDeviceRGB();
	
	// Find out the number of bytes per row (it's just the width times the number of bytes per pixel)
	size_t bytesPerRow = self.size.width * BYTES_PER_PIXEL;
	// Allocate the appropriate amount of memory to hold the bitmap context
	unsigned char *bitmapData = (unsigned char *) malloc(bytesPerRow * self.size.height);
	
	// Create the bitmap context, we set the alpha to none here to tell the bitmap we don't care about alpha values
	CGContextRef context = CGBitmapContextCreate(bitmapData, self.size.width, self.size.height, BITS_PER_COMPONENT, bytesPerRow, colourSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
	
	// Release the bitmap data because we are done using it
	free(bitmapData);
	
	// We are done with the colour space now so no point in keeping it around
	CGColorSpaceRelease(colourSpace);
	
	// Create a CGRect to define the amount of pixels we want
	CGRect rect = CGRectMake(0.0, 0.0, self.size.width, self.size.height);
	// Draw the bitmap context using the rectangle we just created as a bounds and the Core Graphics Image as the image source
	CGContextDrawImage(context, rect, self.CGImage);
	// Obtain the pixel data from the bitmap context
	unsigned char *pixelData = (unsigned char *) CGBitmapContextGetData(context);
	
	// Release the bitmap context because we are done using it
	CGContextRelease(context);
	
	return pixelData;
	#undef BITS_PER_PIXEL
	#undef BITS_PER_COMPONENT
}

@end
