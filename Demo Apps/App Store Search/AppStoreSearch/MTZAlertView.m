//
//  MTZAlertView.m
//  Rewritten APIs
//
//  Created by Matt on 8/25/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZAlertView.h"
#import "UIAlertView+DelegateFix.h"

NSString * const kMTZAlertViewPlainTextInput = @"MTZAlertViewPlainTextInput";
NSString * const kMTZAlertViewSecureTextInput = @"MTZAlertViewSecureTextInput";
NSString * const kMTZAlertViewLoginInput = @"MTZAlertViewLoginInput";
NSString * const kMTZAlertViewPasswordInput = @"MTZAlertViewPasswordInput";

@protocol UIAlertViewDelegate;

@interface MTZAlertView () <UIAlertViewDelegate>

@property (strong, nonatomic) UIAlertView *alertView;

@property (strong, nonatomic) NSMutableArray *_buttonTitles;
@property (strong, nonatomic) NSMutableDictionary *_actionsForButtonTitles;

@property (nonatomic) BOOL cancelButtonOnBottom;

@end

@implementation MTZAlertView

#pragma mark Creating Alert Views

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

- (id)initWithTitle:(NSString *)title andMessage:(NSString *)message
{
	self = [super init];
	if ( self ) {
		_title = title;
		_message = message;
		[self setup];
	}
	return self;
}

+ (id)alertViewWithStyle:(UIAlertViewStyle)style
{
	MTZAlertView *alert = [[MTZAlertView alloc] init];
	alert.style = style;
	return alert;
}

- (void)setup
{
	__buttonTitles = [[NSMutableArray alloc] initWithCapacity:4];
	__actionsForButtonTitles = [[NSMutableDictionary alloc] initWithCapacity:4];
}


#pragma mark Properties

- (NSInteger)cancelButtonIndex
{
	return _alertView.cancelButtonIndex;
}

- (NSArray *)buttonTitles
{
	NSMutableArray *titles = [NSMutableArray arrayWithArray:__buttonTitles];
	if ( _cancelButtonTitle ) {
		[titles addObject:_cancelButtonTitle];
	}
	return titles;
}

- (NSArray *)otherButtonTitles
{
	return __buttonTitles;
}

- (NSUInteger)numberOfButtons
{
	NSUInteger count = __buttonTitles.count;
	if ( _cancelButtonTitle ) count++;
	return count;
}

- (NSUInteger)numberOfOtherButtons
{
	return __buttonTitles.count;
}

- (BOOL)isVisible
{
	return [_alertView isVisible];
}

- (NSDictionary *)inputFieldValues
{
	switch ( _style ) {
		case UIAlertViewStylePlainTextInput:
			return @{kMTZAlertViewPlainTextInput: [_alertView textFieldAtIndex:0].text};
		case UIAlertViewStyleSecureTextInput:
			return @{kMTZAlertViewSecureTextInput: [_alertView textFieldAtIndex:0].text};
		case UIAlertViewStyleLoginAndPasswordInput:
			return @{kMTZAlertViewLoginInput:    [_alertView textFieldAtIndex:0].text,
					 kMTZAlertViewPasswordInput: [_alertView textFieldAtIndex:1].text};
		case UIAlertViewStyleDefault:
		default:
			return nil;
	}
}


#pragma mark Configuring Buttons

- (void)addButtonWithTitle:(NSString *)title andSelector:(SEL)selector
{
	[self addButtonWithTitle:title];
	[__actionsForButtonTitles setObject:NSStringFromSelector(selector) forKey:title];
}

- (void)addButtonWithTitle:(NSString *)title andBlock:(ActionBlock)block
{
	[self addButtonWithTitle:title];
	[__actionsForButtonTitles setObject:block forKey:title];
}

// Add a button with the specified title to the alert view.
// This method is not responsible for adding the block or selector to __actionsForButtonTitles.
// Warning: Caller must add block or selector to __actionsForButtonTitles itself.
- (void)addButtonWithTitle:(NSString *)title
{
	if ( title == nil ) {
		NSLog(@"Button title must be non-nil");
		return;
	}
	
	// If the title already exists, change it's position and upate it's block
	if ( [__actionsForButtonTitles objectForKey:title] ) {
		[__buttonTitles removeObjectIdenticalTo:title];
	}
	
	[__buttonTitles addObject:title];
}


#pragma mark Presenting the Alert View

/// Create a UIAlertView with properties
/// @return A newly created UIAlertView with title, message, alertViewStyle, and buttons
- (UIAlertView *)alertView
{
	if ( _alertView ) return _alertView;
	
	_alertView = [[UIAlertView alloc] init];
	_alertView.title = _title;
	_alertView.message = _message;
	_alertView.alertViewStyle = _style;
	_alertView.retainedDelegate = self;
	
	if ( __buttonTitles.count > 1 ) {
		_cancelButtonOnBottom = YES;
		// Add all the other buttons
		for ( NSString *buttonTitle in __buttonTitles ) {
			[_alertView addButtonWithTitle:buttonTitle];
		}
		// Make sure Cancel is on the bottom when more than two buttons
		if ( _cancelButtonTitle ) {
			[_alertView addButtonWithTitle:_cancelButtonTitle];
			_alertView.cancelButtonIndex = _alertView.numberOfButtons-1;
		}
	} else {
		_cancelButtonOnBottom = NO;
		// Make sure Cancel is on the left when only two buttons
		if ( _cancelButtonTitle ) {
			[_alertView addButtonWithTitle:_cancelButtonTitle];
			_alertView.cancelButtonIndex = 0;
		}
		// Add the other button
		[_alertView addButtonWithTitle:__buttonTitles[0]];
	}
	
	return _alertView;
}

- (void)show
{
	[[self alertView] show];
}


#pragma mark Dismissing the Alert View

- (void)dismissWithCancelAnimated:(BOOL)animated
{
	if ( !_alertView ) {
		NSLog(@"Cannot dismiss MTZAlertView without it being displayed");
		return;
	}
	
	NSInteger cancelButtonIndex = self.cancelButtonIndex;
	if ( cancelButtonIndex == -1 ) {
		// FUTURE: Call cancel if UIAlertView had API for cancelling
		NSLog(@"Cannot cancel this alert view because it doesn't have a cancel button");
		return;
	}
	[_alertView dismissWithClickedButtonIndex:cancelButtonIndex animated:animated];
}

- (void)dismissWithTappedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated
{
	if ( !_alertView) {
		NSLog(@"Cannot dismiss MTZAlertView without it being displayed");
	}
	[_alertView dismissWithClickedButtonIndex:buttonIndex animated:animated];
}

- (void)dismissWithTappedButtonTitle:(NSString *)buttonTitle animated:(BOOL)animated
{
	if ( !_alertView) {
		NSLog(@"Cannot dismiss MTZAlertView without it being displayed");
		return;
	}
	
	NSInteger buttonIndex = 0;
	if ( [buttonTitle isEqualToString:_cancelButtonTitle] ) {
		buttonIndex = [_alertView cancelButtonIndex];
	} else {
		buttonIndex = [self.otherButtonTitles indexOfObjectIdenticalTo:buttonTitle];
		if ( buttonIndex == NSNotFound ) {
			NSLog(@"No button with that title found.");
			return;
		}
	}
	
	[_alertView dismissWithClickedButtonIndex:buttonIndex animated:animated];
}


#pragma mark UIAlertViewDelegate

// TODO: Enhance to not use "first other button"
//- (BOOL)alertView:(MTZAlertView *)alertView shouldEnableButtonWithTitle:(NSString *)buttonTitle;
- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
	NSLog(@"alertViewShouldEnableFirstOtherButton:");
	for ( NSString *buttonTitle in __buttonTitles ) {
		return [_delegate alertView:(MTZAlertView *)alertView shouldEnableButtonWithTitle:buttonTitle];
	}
	
	return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	[self performActionForButtonAtIndex:buttonIndex];
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
	
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	// Alert view is no longer necessary
	_alertView = nil;
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
	if ( [(NSObject *)_delegate respondsToSelector:@selector(alertViewDidCancel:)] ) {
		[_delegate alertViewDidCancel:self];
	}
	
	// Alert view is no longer necessary
	_alertView = nil;
}

- (void)performActionForButtonAtIndex:(NSInteger)buttonIndex
{
	NSInteger otherButtonIndex = buttonIndex;
	if ( _cancelButtonTitle ) {
		if ( buttonIndex == self.cancelButtonIndex ) {
			// Tapped on cancel button
			[_delegate alertViewDidTapCancelButton:self];
			return;
		}
		if ( !_cancelButtonOnBottom ) {
			otherButtonIndex--;
		}
	}
	
	NSString *buttonTitle = self.otherButtonTitles[otherButtonIndex];
	
	id action = __actionsForButtonTitles[buttonTitle];
	// Selector
	if ( [(NSObject *)action isKindOfClass:NSString.class]  ) {
		if ( !_delegate ) {
			NSLog(@"Delegate on MTZAlertView must be non-nil. Selector for button with title \"%@\" not performed.", buttonTitle);
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
		((ActionBlock)action)();
	}
}


@end
