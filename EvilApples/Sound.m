//
//  Sound.m
//  Sounder
//
//  Created by Stan Banes on 2/6/16.
//  Copyright © 2016 Stan Banes. All rights reserved.
//

#import "Sound.h"

@implementation Sound

@synthesize arySounds;
OALSimpleAudio *audio ;
NSArray* myFiles;

- (Sound *)init
	{
	self = [super init];

	// Get the main bundle for the app.
	NSBundle *myBundle = [NSBundle mainBundle];

	// access audio object
	audio = [OALSimpleAudio sharedInstance];
	audio.honorSilentSwitch = YES;
	
	// Preload Available Sounds

	arySounds = [[NSMutableArray	alloc]init];
	NSLog(@"\n\nthe string %@",myBundle);
	myFiles = [myBundle pathsForResourcesOfType:@"mp3" inDirectory:nil];
	for ( NSString *strX in myFiles)
		{
		NSString *strFile = [strX lastPathComponent];
		NSLog(@"File %@\n",strFile);
		[audio preloadEffect:strFile];
		[arySounds addObject:strFile];
		}
	myFiles = [myBundle pathsForResourcesOfType:@"wav" inDirectory:nil];
	for ( NSString *strX in myFiles)
		{
		NSString *strFile = [strX lastPathComponent];
		NSLog(@"File %@\n",strFile);
		[audio preloadEffect:strFile];
		[arySounds addObject:strFile];
		}
	return self;

	}

- (void) PlaySoundNbr:(int) nbrSound
	{
	[audio playEffect:arySounds[nbrSound]];
	}

- (void) PlaySoundStr:(NSString *)namSound
	{
	// play sound
	NSLog(@"Play %@", namSound);
	[audio playEffect:namSound];
	}
@end
