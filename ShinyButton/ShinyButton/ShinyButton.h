//
//  ShinyButton.h
//  ShinyButton
//
//  Created by mac on 2020/1/9.
//  Copyright © 2020 lwb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShinyButton : UIButton

@property (nonatomic, strong) UIColor *myColor;

- (instancetype)initWithFrame:(CGRect)frame withBackgroundColor:(UIColor *)backgroundColor;

- (void)wasPressed;

- (void)endedPressed;

- (void)makeButtonShiny:(ShinyButton *)button withBackgroundColor:(UIColor *)backgroundColor;

@end

NS_ASSUME_NONNULL_END
