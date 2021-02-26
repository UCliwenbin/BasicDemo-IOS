//
//  NSTimer+Block.h
//  TextSlider
//
//  Created by mac on 2020/2/29.
//  Copyright © 2020 lwb. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (Block)

+ (void)timerWithInterval:(NSTimeInterval)interval block:(void(^)(id target))handlerBlock;

@end

NS_ASSUME_NONNULL_END
