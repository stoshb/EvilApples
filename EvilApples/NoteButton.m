//
//  NoteButton.m
//  bbb
//
//  Created by Stan Banes on 2/8/16.
//  Copyright © 2016 Stan Banes. All rights reserved.
//

#import "NoteButton.h"

@implementation NoteButton
@synthesize keyNbr;
@synthesize sndNbr;
@synthesize	idButton;

CCSprite * _sprite;

- (id) initWithKey:(int) Key delegate:(id) Caller
	{
	self = [super init];
		//	self.userInteractionEnabled = YES;
	[self setContentSize: CGSizeMake(50.0, 20.0)];
	self.anchorPoint = ccp(.5, .5);
	self.positionType = CCPositionTypeNormalized;
	[self setColorRGBA:[CCColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0f]];
	keyNbr = Key;
	int lbj1 = ((Key - 1 ) % 8);
	int lbj2 = (Key -1) / 8;
	float ypx = (lbj1 / 8.0) + .0675 ;
	float ypy = (lbj2 / 8.0) + .0675;
	self.position = ccp( ypx, ypy );

	CCNodeColor *cnAJ = [CCNodeColor nodeWithColor:[CCColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0f]];
	cnAJ.anchorPoint = ccp( 0.5, 0.5 );
	[cnAJ setPositionType:CCPositionTypeNormalized];
	[cnAJ setPosition: ccp( .5, .50  )];
	[cnAJ setContentSize:CGSizeMake(50.0, 20.0)];
	[self addChild:cnAJ];

	idButton = [CCButton buttonWithTitle:@"Hit Me" ] ;
	idButton.anchorPoint = ccp(.5,.5);
	idButton.positionType = CCPositionTypeNormalized;
	idButton.name = [NSString stringWithFormat:@"%d", keyNbr];
	idButton.position = ccp(0.5f, 0.5f);
	[idButton setTarget:Caller selector:@selector(IamClicked:) ];
	[idButton setTogglesSelectedState:YES];
	[idButton setLabelColor:[CCColor colorWithRed:0.23 green:0.24 blue:0.64 alpha:0.5f] forState:CCControlStateSelected];
	[idButton setLabelColor:[CCColor colorWithRed:0.64 green:0.24 blue:0.23 alpha:1.0f] forState:CCControlStateNormal];
	[idButton setBackgroundColor:[CCColor colorWithRed:0.64 green:0.24 blue:0.23 alpha:1.0f] forState:CCControlStateSelected] ;
	[idButton setBackgroundColor:[CCColor colorWithRed:0.23 green:0.24 blue:0.64 alpha:0.5f] forState:CCControlStateNormal] ;
	[self addChild:idButton];

	return self;
	}


@end
