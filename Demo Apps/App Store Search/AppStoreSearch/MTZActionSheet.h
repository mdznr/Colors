//
//  MTZActionSheet.h
//  Rewritten APIs
//
//  Created by Matt on 8/23/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <Foundation/Foundation.h>

#warning this typedef probably shouldn't be defined here. It should come from MTZAction?
typedef void (^Block)();

@protocol MTZActionSheetDelegate;

#pragma mark -

NS_CLASS_AVAILABLE_IOS(2_0) @interface MTZActionSheet : NSObject

#pragma mark Creating Action Sheets

#warning TODO: what kinds of quick initalization methods should be presented?
/// Convenience method for initializing an alert view with a particular title.
/// @return Newly initialized action sheet.
- (id)init;

/// Convenience method for initalizing an action sheet with a particular title.
/// @param title The string that appears in the receiver’s title bar.
/// @return Newly initialized action sheet.
- (id)initWithTitle:(NSString *)title;


#pragma mark Properties

/// The receiver’s delegate or nil if it doesn’t have a delegate.
/// @discussion When adding buttons with selectors, those selectors are performed on this.
@property (strong, nonatomic) id<MTZActionSheetDelegate> delegate;

/// The receiver’s presentation style. Default is @c UIActionSheetStyleAutomatic.
/// @discussion This property determines how the action sheet looks when it is presented. For a list of possible values, see the @c UIActionSheetStyle constants.
/// @discussion Ignored if action sheet is already visible.
@property (nonatomic) UIActionSheetStyle style;

/// The string that appears in the receiver’s title bar.
@property (strong, nonatomic) NSString *title;

#warning should setting visibility show and hide the action sheet? This behaviour works for UIWindow
/// A Boolean value that indicates whether the receiver is displayed. (read-only)
@property (nonatomic, readonly, getter=isVisible) BOOL visible;

/// An ordered (top to bottom) array of the button titles.
/// Includes @c cancelButtonTitle and @c destructiveButtonTitle, if set.
- (NSArray *)buttonTitles;

/// An ordered array of the button titles.
/// Does not include @c cancelButtonTitle and @c destructiveButtonTitle.
- (NSArray *)otherButtonTitles;

#warning do we even need this API?
/// The total number of buttons on the action sheet.
/// Includes cancel and destructive buttons, if set.
- (NSUInteger)numberOfButtons;

#warning do we even need this API?
/// The number of buttons on the action sheet.
/// Does not include cancel and destructive buttons.
- (NSUInteger)numberOfOtherButtons;


#pragma mark Configuring Buttons

/// The title of the cancel button (stylized and positioned automatically).
/// @discussion If nil, this specialized button is not shown.
@property (strong, nonatomic) NSString *cancelButtonTitle;

/// The title of the destructive button (stylized and positioned automatically).
/// @discussion If nil, this specialized button is not shown.
@property (strong, nonatomic) NSString *destructiveButtonTitle;

/// Append a new button to the action sheet and, when tapped, call the corresponding selector on the delegate
/// @param title The label that appears on the button
/// @param selector The selector to be performed on the delegate when the button is tapped
- (void)addButtonWithTitle:(NSString *)title andSelector:(SEL)selector;

/// Append a button to the action sheet and, when tapped, perform the corresponding block
/// @param title The label that appears on the button
/// @param selector The block to be performed when the button is tapped
- (void)addButtonWithTitle:(NSString *)title andBlock:(Block)block;


#pragma mark Presenting the Action Sheet

/// Displays an action sheet that originates from the specified tab bar.
/// @param view The tab bar from which the action sheet originates.
/// @discussion The appearance of the action sheet is animated. On iPad, this method centers the action sheet in the middle of the screen. Generally, the @c  showFromRect:inView:animated: method should be used instead when trying to presenting an action sheet relative to a tab bar in an iPad application.
- (void)showFromTabBar:(UITabBar *)view;

/// Displays an action sheet that originates from the specified toolbar.
/// @param view The toolbar from which the action sheet originates.
/// @discussion The appearance of the action sheet is animated. On iPad, this method centers the action sheet in the middle of the screen. Generally, if you want to present an action sheet relative to a toolbar in an iPad application, you should use the @c showFromBarButtonItem:animated: method instead.
/// @discussion Using this method, if style is @c UIActionSheetStyleAutomatic, @c UIActionSheetStyleDefault is used.
- (void)showFromToolbar:(UIToolbar *)view;

/// Displays an action sheet that originates from the specified view.
/// @param view The view from which the action sheet originates.
/// @discussion The appearance of the action sheet is animated. On iPad, this method centers the action sheet in the middle of the screen. Generally, if you want to present an action sheet in an iPad application, you should use the @c showFromRect:inView:animated: method to display the action sheet instead.
/// @discussion Using this method, if style is @c UIActionSheetStyleAutomatic, @c UIActionSheetStyleDefault is used.
- (void)showInView:(UIView *)view;

/// Displays an action sheet that originates from the specified bar button item.
/// @param item The bar button item from which the action sheet originates.
/// @param animated Specify @c YES to animate the presentation of the action sheet or @c NO to present it immediately without any animation effects.
- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated NS_AVAILABLE_IOS(3_2);

/// Displays an action sheet that originates from the specified view.
/// @param rect
/// @param view
/// @param animated
/// @discussion On iPad, this method displays the action sheet in a popover whose arrow points to the specified rectangle of the view. The popover does not overlap the specified rectangle.
/// @discussion Using this method, if style is @c UIActionSheetStyleAutomatic, @c UIActionSheetStyleDefault is used.
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated NS_AVAILABLE_IOS(3_2);


#pragma mark Dismissing the Action Sheet

/// Dismisses the action sheet, as if the user tapped the cancel button, immediately using an optional animation.
/// @param animated Specify YES to animate the dismissal of the action sheet or NO to remove the action sheet without an animation.
/// @discussion You can use this method to dismiss the action sheet programmatically as needed. The action sheet also calls this method itself in response to the user tapping one of the buttons in the action sheet.
/// @discussion In iOS 4.0, you may want to call this method whenever your application moves to the background. An action sheet is not dismissed automatically when an application moves to the background. This behavior differs from previous versions of the operating system, where they were canceled automatically when the application was terminated. Dismissing the action sheet gives the application a chance to save changes or abort the operation and perform any necessary cleanup in case the application is terminated later.
- (void)dismissWithCancelAnimated:(BOOL)animated;

// Hides the action sheet. Use this method when you need to explicitly dismiss the action sheet.
/// Dismisses the action sheet, as if the user tapped the button with the specified title, immediately using an optional animation.
/// @param buttonTitle The title of the button that was tapped.
/// @discussion In iOS 4.0, you may want to call this method whenever your application moves to the background. An action sheet is not dismissed automatically when an application moves to the background. This behavior differs from previous versions of the operating system, where they were canceled automatically when the application was terminated. Dismissing the action sheet gives the application a chance to save changes or abort the operation and perform any necessary cleanup in case the application is terminated later.
- (void)dismissWithTappedButtonTitle:(NSString *)buttonTitle animated:(BOOL)animated;

@end


#pragma mark -

@protocol MTZActionSheetDelegate <NSObject>
@optional

#pragma mark Responding to Actions

// Called when the destructive button is tapped. The view will be automatically dismissed after this call returns
- (void)actionSheetDidTapDestructiveButton:(MTZActionSheet *)actionSheet;

// Called when the cancel button is tapped. The view will be automatically dismissed after this call returns
- (void)actionSheetDidTapCancelButton:(MTZActionSheet *)actionSheet;


#pragma mark Customizing Behavior

// Called before animation and showing view
- (void)willPresentActionSheet:(MTZActionSheet *)actionSheet;

// Called after animation
- (void)didPresentActionSheet:(MTZActionSheet *)actionSheet;


#pragma mark Canceling

// Called when we cancel a view (eg. the user clicks the Home button). This is not called when the user clicks the cancel button.
// If not defined in the delegate, we simulate a click in the cancel button
- (void)actionSheetDidCancel:(MTZActionSheet *)actionSheet;


@end
