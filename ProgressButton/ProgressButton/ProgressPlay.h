//
//  ProgressPlay.h
//  ProgressButton
//
//  Created by mac on 2020/1/10.
//  Copyright © 2020 lwb. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DURATION 20.0
#define PERIOD 0.5

@class ProgressPlay;
@protocol ProgressPlayDelegate <NSObject>

- (void)player:(ProgressPlay *)player didReachPosition:(float)position;

- (void)playerDidStop:(ProgressPlay *)player;

@end

@interface ProgressPlay : NSObject
{
    NSTimer *timer;
}

- (void)play;

- (void)pause;

@property (nonatomic, assign) float position;
@property (nonatomic, weak) id<ProgressPlayDelegate> delegate;

@end


