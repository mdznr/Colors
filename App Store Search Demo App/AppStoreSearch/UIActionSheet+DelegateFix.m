//
//  UIActionSheet+DelegateFix.m
//  Rewritten APIs
//
//  Created by Matt on 8/23/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "UIActionSheet+DelegateFix.h"
#import <objc/runtime.h>

static char const * const retainedDelegateKey = "retainedDelegate";

@implementation UIActionSheet (DelegateFix)

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
