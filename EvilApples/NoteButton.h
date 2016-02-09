//
//  NoteButton.h
//  bbb
//
//  Created by Stan Banes on 2/8/16.
//  Copyright © 2016 Stan Banes. All rights reserved.
//

#import "CCButton.h"
#import "CCSprite.h"
#import "CCNodeColor.h"
#import "CCColor.h"
#import "Sound.h"

@interface NoteButton : CCNode
@property	int	keyNbr;
@property	int	sndNbr;
@property	CCButton *idButton;
- (id) initWithKey:(int) Key delegate:(id) _Caller;

@end
