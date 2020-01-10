//
//  ProgressView.h
//  ProgressButton
//
//  Created by mac on 2020/1/9.
//  Copyright © 2020 lwb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressLayer.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProgressView : UIView

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) CGFloat startAngle;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *trackColor;

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
