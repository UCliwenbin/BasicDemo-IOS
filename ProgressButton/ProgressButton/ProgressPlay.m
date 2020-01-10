//
//  ProgressPlay.m
//  ProgressButton
//
//  Created by mac on 2020/1/10.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "ProgressPlay.h"

@implementation ProgressPlay

- (void)play {
    if (timer) {
        return;
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:PERIOD target:self selector:@selector(timerDidFire:) userInfo:nil repeats:YES];
}

- (void)pause {
    [timer invalidate];
    timer = nil;
}


- (void)timerDidFire:(NSTimer *)theTimer {
    if (self.position >= 1.0) {
        self.position = 0.f;
        [timer invalidate];
        timer = nil;
        [self.delegate playerDidStop:self];
    } else {
        self.position += PERIOD / DURATION;
        [self.delegate player:self didReachPosition:self.position];
    }
}
@end
