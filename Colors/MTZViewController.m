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

@end

@implementation MTZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	_player = [MPMusicPlayerController iPodMusicPlayer];

	// register for media player notifications
	NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self
                           selector:@selector(songChanged:)
                               name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification
                             object:_player];
    [_player beginGeneratingPlaybackNotifications];
	
	// An example of an image
	_iv = [[UIImageView alloc] initWithFrame:(CGRect){20,40,280,280}];
	[self.view addSubview:_iv];
}

- (void)songChanged:(id)sender
{
	MPMediaItem *currentItem = [_player nowPlayingItem];
    MPMediaItemArtwork *artwork = [currentItem valueForProperty: MPMediaItemPropertyArtwork];
	UIImage *albumArtwork = [artwork imageWithSize:CGSizeMake (200, 200)];
    _iv.image = albumArtwork;
	[self refreshColors];
}

- (void)refreshColors
{
	UIColor *bg = [_iv.image backgroundColor];
	self.view.backgroundColor = bg;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
