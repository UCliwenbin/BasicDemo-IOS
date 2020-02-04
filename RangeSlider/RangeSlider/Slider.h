//
//  Slider.h
//  RangeSlider
//
//  Created by mac on 2020/2/3.
//  Copyright © 2020 lwb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Slider : UIControl <UIGestureRecognizerDelegate>

@property (assign, nonatomic) CGFloat minValue;
@property (assign, nonatomic) CGFloat maxValue;

@property (assign, nonatomic) CGFloat leftValue;
@property (assign, nonatomic) CGFloat rightValue;

@property (strong, nonatomic) UIImage *handleImage;
@property (strong, nonatomic) UIImage *leftHandleImage;
@property (strong, nonatomic) UIImage *rightHandleImage;



@property (strong, nonatomic) UIImage *trackBackgroundImage;
@property (strong, nonatomic) UIImage *trackFillImage;

@property (assign, nonatomic) CGFloat stepValue;
@property (assign, nonatomic) CGFloat minimumSpacing;
@property (strong, nonatomic) UIImageView *leftHandle;
@property (strong, nonatomic) UIImageView *rightHandle;
@property (strong, nonatomic) UIImageView *sliderBackground;
@property (strong, nonatomic) UIImageView *sliderFillBackground;

@property (assign, nonatomic) CGFloat leftHandleStartXCoor;
@property (assign, nonatomic) CGFloat rightHandleStartXCoor;

@property (readonly, nonatomic) CGFloat trackWidth;

@property (assign, nonatomic) BOOL didSetup;

- (void)setup;
- (void)leftHandlePanEngadged:(UIGestureRecognizer *)gesture;
- (void)rightHandlePanEngadged:(UIGestureRecognizer *)gesture;

@end

NS_ASSUME_NONNULL_END
