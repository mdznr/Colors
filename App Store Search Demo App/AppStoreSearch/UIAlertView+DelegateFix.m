//
//  UIAlertView+DelegateFix.m
//  Rewritten APIs
//
//  Created by Matt on 8/25/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "UIAlertView+DelegateFix.h"
#import <objc/runtime.h>

static char const * const retainedDelegateKey = "retainedDelegate";

@implementation UIAlertView (DelegateFix)

@dynamic retainedDelegate;

- (id<UIActionSheetDelegate>)retainedDelegate
{
	return objc_getAssociatedObject(self, retainedDelegateKey);
}

- (void)setRetainedDelegate:(id<UIActionSheetDelegate>)retainedDelegate
{
	[self setDelegate:retainedDelegate];
	objc_setAssociatedObject(self, retainedDelegateKey, retainedDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
