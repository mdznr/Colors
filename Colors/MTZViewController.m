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

#import "MTZSlider.h"

@interface MTZViewController ()

@property (strong, nonatomic) MPMusicPlayerController *player;
@property (strong, nonatomic) IBOutlet UIImageView *iv;

@property (strong, nonatomic) IBOutlet MTZSlider *trackSlider;
@property (strong, nonatomic) IBOutlet MTZSlider *volumeSlider;

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
	
	_trackSlider.value = 0.5f;
	_volumeSlider.value = 0.5f;
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
	self.view.tintColor = bg;
	
#warning why do I have to change this myself?
	_trackSlider.tintColor = bg;
	_volumeSlider.tintColor = bg;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
