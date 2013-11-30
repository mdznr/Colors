//
//  MTZAppRecordDownloader.m
//  AppStoreSearch
//
//  Created by Matt Zanchelli on 11/16/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZAppRecordDownloader.h"
#import "AppRecord.h"

// String contants found in the JSON data
static NSString *kResultsStr  = @"results";

static NSString *kAppNameStr  = @"trackName";
static NSString *kArtistStr   = @"sellerName";

static NSString *kImageURLStr = @"artworkUrl100";
static NSString *kAppURLStr   = @"trackViewUrl";

static NSString *kAvgUsrRate  = @"averageUserRating";
static NSString *kNumRatings  = @"userRatingCount";

static NSString *kScreenshotURLs = @"screenshotUrls";

static NSString *kDescriptionText = @"description";

@implementation MTZAppRecordDownloader

+ (void)searchAppStoreForTerm:(NSString *)search completionHandler:(void (^)(NSArray *results))completionHandler
{
	NSString *searchTerm = [search stringByReplacingOccurrencesOfString:@" " withString:@"+"];
	NSString *urlString = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&entity=software", searchTerm];
	NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
	[NSURLConnection sendAsynchronousRequest:urlRequest
									   queue:[NSOperationQueue new]
						   completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
							   [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
							   if ( !data ) {
								   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
																				   message:@"The search could not be performed"
																				  delegate:nil
																		 cancelButtonTitle:@"OK"
																		 otherButtonTitles:nil];
								   dispatch_async(dispatch_get_main_queue(), ^{
									   [alert show];
								   });
								   return;
							   }
							   NSError *e = nil;
							   id JSONObject = [NSJSONSerialization JSONObjectWithData:data
																			   options:0
																				 error:&e];
							   if (e) {
								   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
																				   message:@"The search results could not be read"
																				  delegate:nil
																		 cancelButtonTitle:@"OK"
																		 otherButtonTitles:nil];
								   dispatch_async(dispatch_get_main_queue(), ^{
									   [alert show];
								   });
								   return;
							   }
							   NSArray *results = [self recordsForResults:[JSONObject objectForKey:kResultsStr]];
							   completionHandler(results);
						   }];
    
    // Show in the status bar that network activity is starting
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

+ (NSArray *)recordsForResults:(NSArray *)results
{
	NSMutableArray *a = [[NSMutableArray alloc] initWithCapacity:results.count];
	for ( id result in results ) {
		AppRecord *record = [[AppRecord alloc] init];
		record.appName           = [result objectForKey:kAppNameStr];
		record.artist            = [result objectForKey:kArtistStr];
		record.imageURLString    = [result objectForKey:kImageURLStr];
		record.appURLString      = [result objectForKey:kAppURLStr];
		record.averageUserRating = [result objectForKey:kAvgUsrRate];
		record.numberOfRatings   = [result objectForKey:kNumRatings];
		record.screenshotURLs    = [result objectForKey:kScreenshotURLs];
		record.descriptionText   = [result objectForKey:kDescriptionText];
		
		[a addObject:record];
	}
	return a;
}

@end
