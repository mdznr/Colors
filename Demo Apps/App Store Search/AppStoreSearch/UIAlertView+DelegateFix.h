//
//  UIAlertView+DelegateFix.h
//  Rewritten APIs
//
//  Created by Matt on 8/25/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (DelegateFix)

// This is such a hack to retain the delegate for MTZAlertView
// I wish I could override original property to be strong reference
@property (strong, nonatomic) id<UIAlertViewDelegate> retainedDelegate;

- (id<UIAlertViewDelegate>)retainedDelegate;
- (void)setRetainedDelegate:(id<UIAlertViewDelegate>)retainedDelegate;

@end
