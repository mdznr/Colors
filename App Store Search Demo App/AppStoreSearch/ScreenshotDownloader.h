//
//  ScreenshotDownloader.h
//  AppStoreSearch
//
//  Created by Matt Zanchelli on 11/18/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppRecord;

@interface ScreenshotDownloader : NSObject

@property (nonatomic, strong) AppRecord *appRecord;
@property (nonatomic, copy) void (^completionHandler)(void);
@property (nonatomic) NSUInteger index;

- (void)startDownload;
- (void)cancelDownload;

@end
