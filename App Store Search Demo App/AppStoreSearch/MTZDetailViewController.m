//
//  MTZDetailViewController.m
//  AppStoreSearch
//
//  Created by Matt Zanchelli on 11/15/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZDetailViewController.h"
#import "MTZStarsRatingView.h"
#import "UIImage+Colors.h"
#import "UIColor+NeueColors.h"
#import "MTZActionSheet.h"
#import "UIImage+Crop.h"
#import "UIImage+Mask.h"
#import "MTZOutlinedButton.h"
#import "ScreenshotDownloader.h"
#import "MTZScrollingCardsView.h"

#define SCROLLVIEW_ANIMATION_DURATION 0.5f

@interface MTZDetailViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *appIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *IAPLabel;
@property (weak, nonatomic) IBOutlet MTZStarsRatingView *starsRatingView;
@property (weak, nonatomic) IBOutlet MTZOutlinedButton *downloadAppView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

// The set of ScreenshotDownloader objects for each screenshot
@property (nonatomic, strong) NSMutableDictionary *screenshotDownloadsInProgress;

@property (weak, nonatomic) IBOutlet MTZScrollingCardsView *screenshotsView;
@property (strong, nonatomic) UIImageView *ss1;
@property (strong, nonatomic) UIImageView *ss2;
@property (strong, nonatomic) UIImageView *ss3;
@property (strong, nonatomic) UIImageView *ss4;
@property (strong, nonatomic) UIImageView *ss5;

- (void)configureView;

@end

@implementation MTZDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		[self setupListeners];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self setupListeners];
	}
	return self;
}

- (id)init
{
	self = [super init];
	if (self) {
		[self setupListeners];
	}
	return self;
}

- (void)setupListeners
{
	// Listen to UIContentSizeCategoryDidChangeNotification (Dynamic Type)
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(preferredContentSizeDidChange:)
												 name:UIContentSizeCategoryDidChangeNotification
											   object:nil];
}

#pragma mark - Managing the detail item

- (void)setAppRecord:(AppRecord *)appRecord
{
	if ( _appRecord != appRecord ) {
		_appRecord = appRecord;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
	if ( self.appRecord ) {
		if ( self.appRecord.appIcon ) {
			self.appIconImageView.image = [self.appRecord.appIcon appIconShape];
			UIColor *color = [self.appRecord.appIcon keyColor];
			
			if ( color ) {
//				self.view.tintColor = color;
				[[UIApplication sharedApplication] keyWindow].tintColor = color;
			} else {
				self.view.tintColor = [UIColor neueBlue];
				self.starsRatingView.tintColor = [UIColor neueOrange];
				self.segmentedControl.tintColor = [self.appRecord.appIcon backgroundColor];
			}
			
		} else {
			self.appIconImageView.image = [UIImage imageNamed:@"IconPlaceholder"];
		}
		self.appNameLabel.text = self.appRecord.appName;
		self.artistNameLabel.text = self.appRecord.artist;
		
		self.starsRatingView.averageUserRating = self.appRecord.averageUserRating;
		self.starsRatingView.numberOfRatings = self.appRecord.numberOfRatings;
		
		/*
		if ( self.appRecord.offersIAP ) {
			self.IAPLabel.hidden = NO;
		} else {
			self.IAPLabel.hidden = YES;
		}
		 */
		
		CGSize size = (CGSize){196 + 16, 336};
		self.screenshotsView.scrollView.contentSize = (CGSize){(size.width * self.appRecord.screenshotURLs.count), size.height};
		
		self.descriptionLabel.text = self.appRecord.descriptionText;
		[self.descriptionLabel sizeToFit];
		self.scrollView.contentSize = (CGSize){self.scrollView.frame.size.width, self.descriptionLabel.frame.origin.y + self.descriptionLabel.frame.size.height + 16};
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	[self configureView];
	
	UIBarButtonItem *share = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
																		   target:self
																		   action:@selector(shareApp:)];
	self.navigationItem.rightBarButtonItem = share;
	
	self.scrollView.scrollsToTop = YES;
	
	self.screenshotsView.width = 196.0f;
	self.screenshotsView.height = 336.0f;
	self.screenshotsView.padding = 16.0f;
	
	self.screenshotsView.scrollView.delegate = self;
	
	// Adding image views (Max 5).
	// This is *really* bad solution/code, but it's just a demo app.
	_ss1 = [[UIImageView alloc] initWithFrame:(CGRect){16 + ((196+16) * 0), 16, 196, 336}];
	[self.screenshotsView.scrollView addSubview:_ss1];
	_ss2 = [[UIImageView alloc] initWithFrame:(CGRect){16 + ((196+16) * 1), 16, 196, 336}];
	[self.screenshotsView.scrollView addSubview:_ss2];
	_ss3 = [[UIImageView alloc] initWithFrame:(CGRect){16 + ((196+16) * 2), 16, 196, 336}];
	[self.screenshotsView.scrollView addSubview:_ss3];
	_ss4 = [[UIImageView alloc] initWithFrame:(CGRect){16 + ((196+16) * 3), 16, 196, 336}];
	[self.screenshotsView.scrollView addSubview:_ss4];
	_ss5 = [[UIImageView alloc] initWithFrame:(CGRect){16 + ((196+16) * 4), 16, 196, 336}];
	[self.screenshotsView.scrollView addSubview:_ss5];
	
	[self loadScreenshots];
}

- (void)preferredContentSizeDidChange:(id)sender
{
	// Dynamic type size changed
	self.descriptionLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
	[self.descriptionLabel invalidateIntrinsicContentSize];
	[_scrollView invalidateIntrinsicContentSize];
}

- (void)loadScreenshots
{
	for ( NSUInteger index = 0; index < _appRecord.screenshotURLs.count; ++index ) {
		ScreenshotDownloader *ssDownloader = [self.screenshotDownloadsInProgress objectForKey:@(index)];
		if ( ssDownloader == nil ) {
			ssDownloader = [[ScreenshotDownloader alloc] init];
			ssDownloader.appRecord = _appRecord;
			ssDownloader.index = index;
			[ssDownloader setCompletionHandler:^{
				
				UIImageView *iv = [self imageViewForIndex:index];
				
				// Display the newly loaded image
				iv.image = [_appRecord.screenshots objectForKey:@(index)];
				
				// Remove the ScreenshotDownloader from the in progress list.
				// This will result in it being deallocated.
				[self.screenshotDownloadsInProgress removeObjectForKey:@(index)];
				
			}];
			[self.screenshotDownloadsInProgress setObject:ssDownloader forKey:@(index)];
			[ssDownloader startDownload];
		}
	}
}

- (UIImageView *)imageViewForIndex:(NSUInteger)index
{
	if      ( index == 0 ) return _ss1;
	else if ( index == 1 ) return _ss2;
	else if ( index == 2 ) return _ss3;
	else if ( index == 3 ) return _ss4;
	else if ( index == 4 ) return _ss5;
	return nil;
}

- (void)shareApp:(id)sender
{
	NSArray *activities = @[[NSURL URLWithString:self.appRecord.appURLString]];
	UIActivityViewController *activity = [[UIActivityViewController alloc] initWithActivityItems:activities
																		   applicationActivities:nil];
	activity.excludedActivityTypes = @[UIActivityTypeAddToReadingList];
#warning activity view controller's status bar content should be black
	[self presentViewController:activity animated:YES completion:^{}];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	if ( scrollView == self.screenshotsView.scrollView ) {
		// If the screenshots view scrolled, make sure it's visible
		[UIView animateWithDuration:SCROLLVIEW_ANIMATION_DURATION
							  delay:0.0f
			 usingSpringWithDamping:1.0f
			  initialSpringVelocity:1.0f
							options:UIViewAnimationOptionBeginFromCurrentState
						 animations:^{
							 [self.scrollView setContentOffset:(CGPoint){0, self.segmentedControl.frame.origin.y - 8 - self.scrollView.contentInset.top}];
						 }
						 completion:^(BOOL finished) {}];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
