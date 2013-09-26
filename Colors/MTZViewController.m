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

@property (strong, nonatomic) IBOutlet UILabel *trackTitle;
@property (strong, nonatomic) IBOutlet UILabel *artistAndAlbumTitles;

@property (strong, nonatomic) IBOutlet UILabel *trackLabel;
@property (strong, nonatomic) IBOutlet UILabel *ofTotalTracksLabel;

@property (strong, nonatomic) IBOutlet UILabel *timeElapsed;
@property (strong, nonatomic) IBOutlet UILabel *timeRemaining;

@property (strong, nonatomic) IBOutlet UIButton *playPause;

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
	[notificationCenter addObserver:self
						   selector:@selector(playbackStateDidChange:)
							   name:MPMusicPlayerControllerPlaybackStateDidChangeNotification
							 object:_player];
	[notificationCenter addObserver:self
						   selector:@selector(volumeDidChange:)
							   name:MPMusicPlayerControllerVolumeDidChangeNotification
							 object:_player];
    [_player beginGeneratingPlaybackNotifications];
	
	[self checkPlaybackStatus];
	
	_trackSlider.fillImage = [UIImage imageNamed:@"ProgressFill"];
	_trackSlider.trackImage = [UIImage imageNamed:@"ProgressTrack"];
	[_trackSlider setThumbImage:[UIImage imageNamed:@"ProgressThumb"]
					   forState:UIControlStateNormal];
	
	_volumeSlider.value = _player.volume;
	_volumeSlider.fillImage = [UIImage imageNamed:@"VolumeFill"];
	_volumeSlider.trackImage = [UIImage imageNamed:@"VolumeTrack"];
	[_volumeSlider setThumbImage:[UIImage imageNamed:@"VolumeThumb"]
						forState:UIControlStateNormal];
}

- (void)checkPlaybackStatus
{
	if ( _player.playbackState == MPMusicPlaybackStatePlaying ) {
		[_playPause setImage:[UIImage imageNamed:@"Pause"] forState:UIControlStateNormal];
	} else {
		[_playPause setImage:[UIImage imageNamed:@"Play"] forState:UIControlStateNormal];
	}
}

- (void)songChanged:(id)sender
{
	MPMediaItem *currentItem = [_player nowPlayingItem];
    MPMediaItemArtwork *artwork = [currentItem valueForProperty:MPMediaItemPropertyArtwork];
	UIImage *albumArtwork = [artwork imageWithSize:CGSizeMake(320, 320)];
    _iv.image = albumArtwork;
	[self refreshColors];
	
	_trackTitle.text = [currentItem valueForProperty:MPMediaItemPropertyTitle];
	NSString *artist = [currentItem valueForProperty:MPMediaItemPropertyArtist];
	NSString *album = [currentItem valueForProperty:MPMediaItemPropertyAlbumTitle];
	_artistAndAlbumTitles.text = [NSString stringWithFormat:@"%@ - %@", artist, album];
	
	_trackLabel.text = [NSString stringWithFormat:@"%@", [currentItem valueForProperty:MPMediaItemPropertyAlbumTrackNumber]];
	_ofTotalTracksLabel.text = [NSString stringWithFormat:@"%@", [currentItem valueForProperty:MPMediaItemPropertyAlbumTrackCount]];
	
	/*
	MPNowPlayingInfoCenter *nowPlaying = [MPNowPlayingInfoCenter defaultCenter];
	NSNumber *playbackElapsed = [[nowPlaying nowPlayingInfo] valueForKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];
	
	double elapsed = playbackElapsed.doubleValue;
	float minutes = floor(elapsed / 60 );
	float seconds = round(elapsed - minutes * 60);
	_timeElapsed.text = [NSString stringWithFormat:@"%.0f:%.0f", minutes, seconds];
	 */
	
	NSNumber *playbackDuration = [currentItem valueForProperty:MPMediaItemPropertyPlaybackDuration];
	NSTimeInterval duration = playbackDuration.doubleValue;
	NSTimeInterval remaining = duration - elapsed;
	minutes = floor(remaining / 60);
	seconds = round(remaining - minutes * 60);
	_timeRemaining.text = [NSString stringWithFormat:@"-%.0f:%.0f", minutes, seconds];
}

- (void)playbackStateDidChange:(id)sender
{
	switch ( _player.playbackState ) {
		case MPMusicPlaybackStatePlaying:
			[_playPause setImage:[UIImage imageNamed:@"Pause"] forState:UIControlStateNormal];
			break;
		case MPMusicPlaybackStateStopped:
			[_player stop];
		case MPMusicPlaybackStatePaused:
			[_playPause setImage:[UIImage imageNamed:@"Play"] forState:UIControlStateNormal];
		default:
			break;
	}
}

- (void)volumeDidChange:(id)sender
{
	_volumeSlider.value = _player.volume;
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

- (IBAction)playPause:(id)sender
{
	if ( _player.playbackState == MPMusicPlaybackStatePlaying ) {
        [_player pause];
    } else {
        [_player play];
    }
}

- (IBAction)fastForward:(id)sender
{
	[_player skipToNextItem];
}

- (IBAction)rewind:(id)sender
{
#warning go to previous item if in the first few seconds of playback else, go to beginning of song
	[_player skipToPreviousItem];
}

- (IBAction)volumeChanged:(id)sender
{
	_player.volume = _volumeSlider.value;
}

- (void)dealloc
{
#warning unregister notifications?
	[_player endGeneratingPlaybackNotifications];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
