//
//  MTZAlertView.h
//  Rewritten APIs
//
//  Created by Matt on 8/25/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import <Foundation/Foundation.h>

#warning this typedef probably shouldn't be defined here. It should come from MTZAction?
typedef void (^Block)();

@protocol MTZAlertViewDelegate;

#pragma mark -

NS_CLASS_AVAILABLE_IOS(2_0) @interface MTZAlertView : NSObject

#pragma mark Creating Alert Views

#warning TODO: what kinds of quick initalization methods should be presented?
/// Convenience method for initializing an alert view with a particular title.
/// @param title The string that appears in the receiver’s title bar.
/// @return Newly initialized alert view.
- (id)initWithTitle:(NSString *)title;

/// Convenience method for initializing an alert view with a particular title and message.
/// @param title The string that appears in the receiver’s title bar.
/// @param message Descriptive text that provides more details than the title.
/// @return Newly initialized alert view.
- (id)initWithTitle:(NSString *)title andMessage:(NSString *)message;

/// Convenience method for initializing an alert view with a particular style.
/// @param style The kind of alert displayed to the user.
/// @return Newly initialized alert view.
+ (id)alertViewWithStyle:(UIAlertViewStyle)style NS_AVAILABLE_IOS(5_0);


#pragma mark Properties

/// The receiver’s delegate or nil if it doesn’t have a delegate.
/// @discussion When adding buttons with selectors, those selectors are performed on this.
@property (strong, nonatomic) id<MTZAlertViewDelegate> delegate;

/// The kind of alert displayed to the user.
/// @discussion This property determines how the alert view looks when it is presented. For a list of possible values, see the @c UIAlertViewStyle constants.
@property (nonatomic) UIAlertViewStyle style NS_AVAILABLE_IOS(5_0);

/// The string that appears in the receiver’s title bar.
@property (strong, nonatomic) NSString *title;

/// Descriptive text that provides more details than the title.
@property (strong, nonatomic) NSString *message;

#warning should setting visibility show and hide the alert? This behaviour works for UIWindow
/// A Boolean value that indicates whether the receiver is displayed. (read-only)
@property (nonatomic, readonly, getter = isVisible) BOOL visible;

/// An ordered array of the button titles.
/// Includes @c cancelButtonTitle, if set.
- (NSArray *)buttonTitles;

/// An ordered array of the button titles.
/// Does not include @c cancelButtonTitle.
- (NSArray *)otherButtonTitles;

#warning do we even need this API?
/// The total number of buttons on the alert view.
/// Includes the cancel button, if set.
- (NSUInteger)numberOfButtons;

#warning do we even need this API?
/// The number of buttons on the alert view.
/// Does not include the cancel button.
- (NSUInteger)numberOfOtherButtons;

#warning should have unique methods for each kind of style?
#warning or should return NSDictionary with field type (e.g. "password") as key
/// The text value for the input fields (only available in some styles)
/// @discussion @c UIAlertViewStyleDefault will have no input fields and will always return nil
/// @discussion @c UIAlertViewStylePlainTextInput will have one input field
/// @discussion @c UIAlertViewStyleSecureTextInput will have one input field
/// @discussion @c UIAlertViewStyleLoginAndPasswordInput will have two input fields.
- (NSDictionary *)inputFieldValues NS_AVAILABLE_IOS(5_0);


#pragma mark Configuring Buttons

/// The title of the cancel button (stylized and positioned automatically).
/// @discussion If nil, this specialized button is not shown.
@property (strong, nonatomic) NSString *cancelButtonTitle;

/// Append a new button to the alert and, when tapped, call the corresponding selector on the delegate
/// @param title The label that appears on the button
/// @param selector The selector to be performed on the delegate when the button is tapped
- (void)addButtonWithTitle:(NSString *)title andSelector:(SEL)selector;

/// Append a button to the alert and, when tapped, perform the corresponding block
/// @param title The label that appears on the button
/// @param selector The block to be performed when the button is tapped
- (void)addButtonWithTitle:(NSString *)title andBlock:(Block)block;


#pragma mark Presenting the Alert View

/// Displays the receiver using animation.
- (void)show;


#pragma mark Dismissing the Alert View

/// Dismisses the receiver as if the user tapped the cancel button, optionally with animation.
/// This does not work if @c cancelButtonTitle is not set.
/// @param animated YES if the receiver should be removed by animating it first; otherwise, NO if it should be removed immediately with no animation.
/// @discussion In iOS 4.0, you may want to call this method whenever your application moves to the background. An alert view is not dismissed automatically when an application moves to the background. This behavior differs from previous versions of the operating system, where they were canceled automatically when the application was terminated. Dismissing the alert view gives your application a chance to save changes or abort the operation and perform any necessary cleanup in case your application is terminated later.
- (void)dismissWithCancelAnimated:(BOOL)animated;

/// Dismisses the receiver, optionally with animation. This should only be used when explicity dismissing the alert is absolutely necessary.
/// @param buttonTitle The title of the button that was tapped just before invoking this method.
/// @param animated @c YES if the receiver should be removed by animating it first; otherwise, @c NO if it should be removed immediately with no animation.
/// @discussion In iOS 4.0, you may want to call this method whenever your application moves to the background. An alert view is not dismissed automatically when an application moves to the background. This behavior differs from previous versions of the operating system, where they were canceled automatically when the application was terminated. Dismissing the alert view gives your application a chance to save changes or abort the operation and perform any necessary cleanup in case your application is terminated later.
- (void)dismissWithTappedButtonTitle:(NSString *)buttonTitle animated:(BOOL)animated;


@end


#pragma mark -

@protocol MTZAlertViewDelegate <NSObject>
@optional

#pragma mark Responding to Actions

/// Sent to the delegate when the user taps the cancel button on an alert view.
/// @param alertView The alert view containing the button.
/// @discussion The receiver is automatically dismissed after this method is invoked.
- (void)alertViewDidTapCancelButton:(MTZAlertView *)alertView;


#pragma mark Customizing Behavior

/// Sent to the delegate before an alert view is presented to the user.
/// @param alertView The alert view that is about to be displayed.
/// @discussion Called before animation and showing alert
- (void)willPresentAlertView:(MTZAlertView *)alertView;

/// @param alertView The alert view that was displayed.
/// @discussion Sent to the delegate after an alert view is presented to the user.
- (void)didPresentAlertView:(MTZAlertView *)alertView;

#warning rework the way this works
// Called after edits in any of the default fields added by the style
//- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView;
#warning should be more like this? (Called for each (non-cancel?) button

/// @param alertView The alert view that is being configured.
/// @param buttonTitle The title of the button that should or shouldn't be enabled.
/// @return @c YES if the button should be enabled, @c NO if the button should be disabled.
- (BOOL)alertView:(MTZAlertView *)alertView shouldEnableButtonWithTitle:(NSString *)buttonTitle;


#pragma mark Canceling

#warning @discussion is incorrect. Did cancel and will cancel?
/// Sent to the delegate when an alert view has been canceled.
/// @param alertView The alert view that did get canceled.
/// @discussion This is sent to the delegate when an alert is canceled (e.g. the user clicks the Home button). This is not called when the user clicks the cancel button. If the alert view’s delegate does not implement this method, clicking the cancel button is simulated and the alert view is dismissed. Implement this method if some actions need to be performed before an alert view is canceled. An alert view can be canceled at any time by the system—for example, when the user taps the Home button. The @c alertView:willDismissWithButtonIndex: and @c alertView:didDismissWithButtonIndex: methods are invoked after this method.
- (void)alertViewDidCancel:(MTZAlertView *)alertView;


@end
