//
//  MTZActionSheet.m
//  Rewritten APIs
//
//  Created by Matt on 8/23/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZActionSheet.h"
#import "UIActionSheet+DelegateFix.h"

@protocol UIActionSheetDelegate;

@interface MTZActionSheet () <UIActionSheetDelegate>

@property (strong, nonatomic) UIActionSheet *actionSheet;

@property (strong, nonatomic) NSMutableArray *buttonTitles;
@property (strong, nonatomic) NSMutableDictionary *actionsForButtonTitles;

@end


@implementation MTZActionSheet

#pragma mark Creating Action Sheets

- (id)init
{
	self = [super init];
	if ( self ) {
		[self setup];
	}
	return self;
}

- (id)initWithTitle:(NSString *)title
{
	self = [super init];
	if ( self ) {
		_title = title;
		[self setup];
	}
	return self;
}

- (void)setup
{
	_buttonTitles = [[NSMutableArray alloc] initWithCapacity:4];
	_actionsForButtonTitles = [[NSMutableDictionary alloc] initWithCapacity:4];
}


#pragma mark Properties

- (NSArray *)buttonTitles
{
	NSMutableArray *titles = [NSMutableArray arrayWithArray:_buttonTitles];
	if ( _destructiveButtonTitle ) {
		[titles insertObject:_destructiveButtonTitle atIndex:0];
	}
	if ( _cancelButtonTitle ) {
		[titles addObject:_cancelButtonTitle];
	}
	return titles;
}

- (NSArray *)otherButtonTitles
{
	return _buttonTitles;
}

- (NSUInteger)numberOfButtons
{
	NSUInteger count = _buttonTitles.count;
	if ( _destructiveButtonTitle ) count++;
	if ( _cancelButtonTitle ) count++;
	return count;
}

- (NSUInteger)numberOfOtherButtons
{
	return _buttonTitles.count;
}

- (BOOL)isVisible
{
	return [_actionSheet isVisible];
}


#pragma mark Configuring Buttons

- (void)addButtonWithTitle:(NSString *)title andSelector:(SEL)selector
{
	if ( title == nil ) {
		NSLog(@"Button title cannot be nil");
		return;
	}
	
	// If the title already exists, change it's position and update it's selector
	if ( [_actionsForButtonTitles objectForKey:title] ) {
		[_buttonTitles removeObjectIdenticalTo:title];
	}
	
	[_buttonTitles addObject:title];
	[_actionsForButtonTitles setObject:NSStringFromSelector(selector)
								forKey:title];
}

- (void)addButtonWithTitle:(NSString *)title andBlock:(Block)block
{
	if ( title == nil ) {
		NSLog(@"Button title cannot be nil");
		return;
	}
	
	// If the title already exists, change it's position and update it's selector
	if ( [_actionsForButtonTitles objectForKey:title] ) {
		[_buttonTitles removeObjectIdenticalTo:title];
	}
	
	[_buttonTitles addObject:title];
	[_actionsForButtonTitles setObject:block forKey:title];
}


#pragma mark Presenting the Action Sheet

- (UIActionSheet *)actionSheet
{
	if ( _actionSheet ) return _actionSheet;
	
	_actionSheet = [[UIActionSheet alloc] init];
	_actionSheet.title = _title;
	_actionSheet.actionSheetStyle = _style;
	_actionSheet.retainedDelegate = self;
	
	// Make sure destructive is always on the top
	if ( _destructiveButtonTitle ) {
		[_actionSheet addButtonWithTitle:_destructiveButtonTitle];
		_actionSheet.destructiveButtonIndex = 0;
	}
	
	for ( NSString *buttonTitle in _buttonTitles ) {
		[_actionSheet addButtonWithTitle:buttonTitle];
	}
	
	// Make sure cancel is always on the bottom
	if ( _cancelButtonTitle ) {
		[_actionSheet addButtonWithTitle:_cancelButtonTitle];
		_actionSheet.cancelButtonIndex = _actionSheet.numberOfButtons-1;
	}
	
	return _actionSheet;
}

- (void)showFromTabBar:(UITabBar *)view
{
	[[self actionSheet] showFromTabBar:view];
}

- (void)showFromToolbar:(UIToolbar *)view
{
	[[self actionSheet] showFromToolbar:view];
}

- (void)showInView:(UIView *)view
{
	[[self actionSheet] showInView:view];
}

- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
	[[self actionSheet] showFromBarButtonItem:item animated:animated];
}

- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated
{
	[[self actionSheet] showFromRect:rect inView:view animated:animated];
}


#pragma mark Dismissing the Action Sheet

- (void)dismissWithCancelAnimated:(BOOL)animated
{
	if ( !_actionSheet ) {
		NSLog(@"Cannot dismiss MTZActionSheet without it being displayed");
		return;
	}
	
	NSInteger cancelButtonIndex = [_actionSheet cancelButtonIndex];
	if ( cancelButtonIndex == -1 ) {
#warning would be nice if UIActionSheet did have API for cancelling
		NSLog(@"Cannot cancel this action sheet because it doesn't have a cancel button");
		return;
	}
	[_actionSheet dismissWithClickedButtonIndex:cancelButtonIndex animated:animated];
}

- (void)dismissWithTappedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated
{
	if ( !_actionSheet) {
		NSLog(@"Cannot dismiss MTZActionSheet without it being displayed");
		return;
	}
	
	[_actionSheet dismissWithClickedButtonIndex:buttonIndex animated:animated];
}

- (void)dismissWithTappedButtonTitle:(NSString *)buttonTitle animated:(BOOL)animated
{
	if ( !_actionSheet) {
		NSLog(@"Cannot dismiss MTZActionSheet without it being displayed");
		return;
	}
	
	NSInteger buttonIndex = 0;
	if ( [buttonTitle isEqualToString:_destructiveButtonTitle] ) {
		buttonIndex = 0;
	} else if ( [buttonTitle isEqualToString:_cancelButtonTitle] ) {
		buttonIndex = self.numberOfButtons-1;
	} else {
		buttonIndex = [_buttonTitles indexOfObjectIdenticalTo:buttonTitle];
		if ( buttonIndex == NSNotFound ) {
			NSLog(@"No button with that title found.");
			return;
		}
		if ( _destructiveButtonTitle ) {
			buttonIndex++;
		}
	}
	
	[_actionSheet dismissWithClickedButtonIndex:buttonIndex animated:animated];
}


#pragma mark UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	[self performActionForButtonAtIndex:buttonIndex];
}

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
	if ( [(NSObject *)_delegate respondsToSelector:@selector(willPresentActionSheet:)] ) {
		[_delegate willPresentActionSheet:self];
	}
}

- (void)didPresentActionSheet:(UIActionSheet *)actionSheet
{
	if ( [(NSObject *)_delegate respondsToSelector:@selector(didPresentActionSheet:)] ) {
		[_delegate didPresentActionSheet:self];
	}
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
	
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	// Action sheet is no longer necessary
	_actionSheet = nil;
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
	if ( [(NSObject *)_delegate respondsToSelector:@selector(actionSheetDidCancel:)] ) {
		[_delegate actionSheetDidCancel:self];
	}
	
	// Action sheet is no longer necessary
	_actionSheet = nil;
}

- (void)performActionForButtonAtIndex:(NSInteger)buttonIndex
{
	NSInteger otherButtonIndex = buttonIndex;
	if ( _destructiveButtonTitle ) {
		if ( buttonIndex == 0 ) {
			// Tapped on destructive button
			[_delegate actionSheetDidTapDestructiveButton:self];
			return;
		}
		otherButtonIndex--;
	}
	
	if ( _cancelButtonTitle && buttonIndex == self.numberOfButtons-1 ) {
		// Tapped on cancel button
		[_delegate actionSheetDidTapCancelButton:self];
		return;
	}
	
	NSString *buttonTitle = _buttonTitles[otherButtonIndex];
	
	id action = _actionsForButtonTitles[buttonTitle];
	
	// Selector
	if ( [(NSObject *)action isKindOfClass:NSString.class]  ) {
		if ( !_delegate ) {
			NSLog(@"Delegate on MTZActionSheet must be non-nil. Selector for button with title \"%@\" not performed.", buttonTitle);
			return;
		}
		SEL selector = NSSelectorFromString((NSString *)action);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
		if ( [(NSObject *)_delegate respondsToSelector:selector] ) {
			[(NSObject *)_delegate performSelector:selector withObject:self];
		}
#pragma clang diagnostic pop
	}
	// Block
	else {
		((Block)action)();
	}
}

@end
