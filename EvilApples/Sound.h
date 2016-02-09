//
//  Sound.h
//  Sounder
//
//  Created by Stan Banes on 2/6/16.
//  Copyright © 2016 Stan Banes. All rights reserved.
//

#import "CCScene.h"
#import "OALSimpleAudio.h"

@interface Sound : CCScene

@property NSMutableArray	*arySounds;	
	
- (void) PlaySoundNbr:(int)nbrSound;
- (void) PlaySoundStr:(NSString*)SoundName;
	
@end
