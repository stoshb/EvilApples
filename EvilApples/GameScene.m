//
//  GameScene.m
//
//  Created by : Stan Banes
//  Project    : bbb
//  Date       : 2/8/16
//
//  Copyright (c) 2016 Stan Banes.
//  All rights reserved.
//
// -----------------------------------------------------------------

#import "GameScene.h"

// -----------------------------------------------------------------------

@implementation GameScene

// -----------------------------------------------------------------------

@synthesize NotePics;
@synthesize Sounder;
int			nbrLastButton;
int			nbrLastSound;
CCButton*	idLastButton;
CCButton*	EZBtn;
BOOL			Easy;
		
- (id)init
{
	// Apple recommend assigning self with supers return value
	self = [super init];

	Sounder = [[Sound alloc]init];

	// Background
	CCSprite9Slice *background = [CCSprite9Slice spriteWithImageNamed:@"white_square.png"];
	background.anchorPoint = CGPointZero;
	background.anchorPoint = ccp(0,0);
	background.contentSize = [CCDirector sharedDirector].viewSize;
	background.color = [CCColor colorWithRed:.76 green:.99 blue:.77 alpha:.2f];
	[self addChild:background];

	//
	//	Set up buttons
	//
	CCNodeColor *cnAJ = [CCNodeColor nodeWithColor:[CCColor colorWithRed:.3 green:.75 blue:.1 alpha:.5f]];
	cnAJ.anchorPoint = ccp( 0.5, 0.5 );
	[cnAJ setPositionType:CCPositionTypeNormalized];
	[cnAJ setPosition: ccp( .5, .55  )];
	[cnAJ setContentSize:CGSizeMake( 500, 270 )];
	[self addChild:cnAJ];

	NotePics = [[NSMutableArray alloc] initWithCapacity:50];
	for ( int lbj = 1; lbj <= 64 ; lbj++ )
		{
		NoteButton *NB = [[NoteButton alloc]initWithKey:lbj delegate:self];
		[cnAJ addChild:NB];
		[NotePics addObject:NB];
		}

	CCNodeColor *cnEZ = [CCNodeColor nodeWithColor:[CCColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0f]];
	cnEZ.anchorPoint = ccp( 0.5, 0.5 );
	[cnEZ setPositionType:CCPositionTypeNormalized];
	[cnEZ setPosition: ccp( 0.25f, 0.05f  )];
	[cnEZ setContentSize:CGSizeMake(50.0, 20.0)];
	[self addChild:cnEZ];

	CCNodeColor *cnRR = [CCNodeColor nodeWithColor:[CCColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0f]];
	cnRR.anchorPoint = ccp( 0.5, 0.5 );
	[cnRR setPositionType:CCPositionTypeNormalized];
	[cnRR setPosition: ccp( 0.75f, 0.05f  )];
	[cnRR setContentSize:CGSizeMake(50.0, 20.0)];
	[self addChild:cnRR];

	Easy = YES;
	EZBtn = [CCButton buttonWithTitle:@"Easy" ] ;
	EZBtn.positionType = CCPositionTypeNormalized;
	EZBtn.position = ccp(0.5f, 0.5f);
	[EZBtn setTarget:self selector:@selector(EasyButton)];
	[EZBtn setLabelColor:[CCColor colorWithRed:0.23 green:0.24 blue:0.64 alpha:0.5f] forState:CCControlStateSelected];
	[EZBtn setLabelColor:[CCColor colorWithRed:0.64 green:0.24 blue:0.23 alpha:1.0f] forState:CCControlStateNormal];
	[EZBtn setBackgroundColor:[CCColor colorWithRed:0.64 green:0.24 blue:0.23 alpha:1.0f] forState:CCControlStateSelected] ;
	[EZBtn setBackgroundColor:[CCColor colorWithRed:0.23 green:0.24 blue:0.64 alpha:0.5f] forState:CCControlStateNormal] ;
	[cnEZ addChild:EZBtn];

	CCButton *ResetBtn = [CCButton buttonWithTitle:@"Reset" ] ;
	ResetBtn.positionType = CCPositionTypeNormalized;
	ResetBtn.position = ccp(0.5f, 0.5f);
	[ResetBtn setTarget:self selector:@selector(ResetButtons)];
	[ResetBtn setLabelColor:[CCColor colorWithRed:0.23 green:0.24 blue:0.64 alpha:0.5f] forState:CCControlStateSelected];
	[ResetBtn setLabelColor:[CCColor colorWithRed:0.64 green:0.24 blue:0.23 alpha:1.0f] forState:CCControlStateNormal];
	[ResetBtn setBackgroundColor:[CCColor colorWithRed:0.64 green:0.24 blue:0.23 alpha:1.0f] forState:CCControlStateSelected] ;
	[ResetBtn setBackgroundColor:[CCColor colorWithRed:0.23 green:0.24 blue:0.64 alpha:0.5f] forState:CCControlStateNormal] ;
	[cnRR addChild:ResetBtn];

	[self ResetButtons];

	return self;
}

- (void) EasyButton
	{
	if (Easy)
		{
		Easy = NO;
		EZBtn.title = @"Hard";
		}
	else
		{
		Easy = YES;
		EZBtn.title = @"Easy";
		}
	[self ResetButtons];
	}
		

- (void) ResetButtons
	{
	NSLog(@"Reset Buttons");
	for ( int i = 0 ; i < [NotePics count]; i++ )
		{
		NoteButton *NB = (NoteButton *)NotePics[i];
		NB.sndNbr =  (arc4random() % [Sounder.arySounds count]);
		if ( Easy )	{ NB.idButton.title = FORMAT(@"%i - %i", (i + 1), NB.sndNbr); }
		else 			{ NB.idButton.title = @"Hit Me"; }
		[NB.idButton setSelected:NO];
		[NB.idButton setEnabled:YES];
		}
	nbrLastButton = -1;
	nbrLastSound  = -1;
	idLastButton = nil;
	}

- (IBAction) IamClicked:(id)sender
	{
	CCButton *ccNB = (CCButton *)sender;
	int lbj = [ccNB.name integerValue] - 1;
	NoteButton *NB = (NoteButton *)NotePics[lbj];
	NSLog(@"Button %i clicked with sound %i", lbj + 1, NB.sndNbr);
	[Sounder PlaySoundNbr:NB.sndNbr]; 
	if ( nbrLastSound == NB.sndNbr )
		{
		NSLog(@"Matched Sound");
		ccNB.title = @"Current";
		idLastButton.title = @"Old";
		[ccNB setHighlighted:NO];
		[ccNB setEnabled:NO];
		[idLastButton setHighlighted:NO];
		[idLastButton setEnabled:NO];
		nbrLastSound = -1;
		idLastButton = nil;
		}
	else
		{
		[idLastButton setSelected:NO];
		}
	nbrLastSound = NB.sndNbr;
	idLastButton = sender;
	}

// -----------------------------------------------------------------------

@end























// why not add a few extra lines, so we dont have to sit and edit at the bottom of the screen ...
