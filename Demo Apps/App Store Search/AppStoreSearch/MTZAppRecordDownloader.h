//
//  MTZAppRecordDownloader.h
//  AppStoreSearch
//
//  Created by Matt Zanchelli on 11/16/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTZAppRecordDownloader : NSObject

///	Search the App Store using the specified search terms.
///
///	@param search            The term to search the App Store for
///	@param completionHandler A block to be called after the search has been performed. The block receives an array of AppRecord
+ (void)searchAppStoreForTerm:(NSString *)search completionHandler:(void (^)(NSArray *results))completionHandler;

@end
