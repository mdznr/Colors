//
//  UIActionSheet+DelegateFix.h
//  Rewritten APIs
//
//  Created by Matt on 8/23/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActionSheet (DelegateFix)

// This is such a hack to retain the delegate for MTZActionSheet
// I wish I could override original property to be strong reference
@property (strong, nonatomic) id<UIActionSheetDelegate> retainedDelegate;

- (id<UIActionSheetDelegate>)retainedDelegate;
- (void)setRetainedDelegate:(id<UIActionSheetDelegate>)retainedDelegate;

@end
