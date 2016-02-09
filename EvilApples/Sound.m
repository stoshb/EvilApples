//
//  Sound.m
//  Sounder
//
//  Created by Stan Banes on 2/6/16.
//  Copyright © 2016 Stan Banes. All rights reserved.
//

//	To use this class with your code
//	
//		1.	Put all your sound files (.wav, .mp3) into your project where they become part of the bundle
//		
//		2.	In your code create a reference to Sound.h
//		
//				#import Sound.h
//				:
//				:
//				Sounder = [[Sound alloc]init];
//				
//				This step will read all sound files into memory to allow them to be played by name
//				
//		3. Properties
//		
//			NSMutableArray	*arySounds
//				
//					Contains the name of all sound files	
//					
//		4.	Methods
//		
//			- (Sound *) init										Loads sounds into memory of easy, quick use
//			- (void) PlaySoundNbr:(int)nbrSound;			Plays sound specified as an index into the arySounds array
//			- (void) PlaySoundStr:(NSString*)SoundName;	Plays sound specified by name given as a string
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
	[audio playEffect:namSound];
	}
@end
