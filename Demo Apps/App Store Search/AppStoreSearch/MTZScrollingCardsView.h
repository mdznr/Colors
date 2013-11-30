//
//  MTZScrollingCardsView.h
//  AppStoreSearch
//
//  Created by Matt Zanchelli on 11/18/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTZScrollingCardsView : UIView

@property (strong, nonatomic) UIScrollView *scrollView;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat padding;

@end
