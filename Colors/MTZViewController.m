//
//  MTZViewController.m
//  Colors
//
//  Created by Matt on 9/2/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZViewController.h"

#import <MediaPlayer/MediaPlayer.h>

#import "UIColor+Components.h"
#import "UIColor+Hex.h"
#import "UIColor+Manipulation.h"
#import "UIColor+NeueColors.h"
#import "UIImage+Colors.h"
#import "UIImage+Crop.h"

@interface MTZViewController ()

@property (strong, nonatomic) MPMusicPlayerController *player;
@property (strong, nonatomic) UIImageView *iv;

@property (strong, nonatomic) UISlider *trackSlider;
@property (strong, nonatomic) UISlider *volumeSlider;

@end

@implementation MTZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	_player = [MPMusicPlayerController iPodMusicPlayer];

	// Register for media player notifications
	NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self
                           selector:@selector(songChanged:)
                               name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification
                             object:_player];
    [_player beginGeneratingPlaybackNotifications];
	
	// An example of an image
	_iv = [[UIImageView alloc] initWithFrame:(CGRect){0,64,320,320}];
	[self.view addSubview:_iv];
	
#warning DO NOT HARDCODE FRAMES!
	
	// Track Position Slider
	_trackSlider = [[UISlider alloc] init];
	_trackSlider.frame = (CGRect){52,400,216,12};
	_trackSlider.value = 0.5f;
	[self.view addSubview:_trackSlider];
	
	// Volume Slider
	_volumeSlider = [[UISlider alloc] init];
	_volumeSlider.frame = (CGRect){52,521,216,12};
	_volumeSlider.value = 0.5f;
	[self.view addSubview:_volumeSlider];
}

- (void)songChanged:(id)sender
{
	MPMediaItem *currentItem = [_player nowPlayingItem];
    MPMediaItemArtwork *artwork = [currentItem valueForProperty:MPMediaItemPropertyArtwork];
	UIImage *albumArtwork = [artwork imageWithSize:CGSizeMake(320, 320)];
    _iv.image = albumArtwork;
	[self refreshColors];
}

- (void)refreshColors
{
#warning animate this change? Animate the change of album art (if it changes), too?
	UIColor *bg = [_iv.image backgroundColor];
	_trackSlider.tintColor = bg;
	_volumeSlider.tintColor = bg;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
