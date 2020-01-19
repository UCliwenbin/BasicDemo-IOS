//
//  LWBFang.h
//  RotateButton
//
//  Created by mac on 2020/1/18.
//  Copyright © 2020 lwb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LWBFang : UIView

@property (nonatomic, strong) UIImage *roundImage;
@property (nonatomic, assign) BOOL isPlay;
@property (nonatomic, assign) CGFloat rotationDuration;
@property (nonatomic, strong) UIImageView *roundImageView;
@property (nonatomic, strong) UIImageView *playStateView;
@property (nonatomic, strong) CABasicAnimation *rotationAnimation;

- (void)play;
- (void)pause;

@end

NS_ASSUME_NONNULL_END
