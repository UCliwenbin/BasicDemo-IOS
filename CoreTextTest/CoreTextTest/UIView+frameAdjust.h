//
//  UIView+frameAdjust.h
//  CoreTextTest
//
//  Created by mac on 2020/1/9.
//  Copyright © 2020 lwb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (frameAdjust)


- (CGFloat)x;

- (void)setX:(CGFloat)x;

- (CGFloat)y;

- (void)setY:(CGFloat)y;

- (CGFloat)height;

- (void)setHeight:(CGFloat)height;

- (CGFloat)width;

- (void)setWidth:(CGFloat)width;
@end


NS_ASSUME_NONNULL_END
