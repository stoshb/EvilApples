//
//  GameScene.h
//
//  Created by : Stan Banes
//  Project    : bbb
//  Date       : 2/8/16
//
//  Copyright (c) 2016 Stan Banes.
//  All rights reserved.
//
// -----------------------------------------------------------------

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "cocos2d-ui.h"
#import "NoteButton.h"
#import "Sound.h"

// -----------------------------------------------------------------------
#define FORMAT(format, ...) [NSString stringWithFormat:(format), ##__VA_ARGS__]

@interface GameScene : CCScene

// -----------------------------------------------------------------------

- (instancetype)init;

@property	NSMutableArray	*NotePics;
@property	Sound *Sounder;
// -----------------------------------------------------------------------

@end
































