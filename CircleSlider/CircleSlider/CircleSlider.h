//
//  CircleSlider.h
//  CircleSlider
//
//  Created by mac on 2020/1/29.
//  Copyright © 2020 lwb. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kLineWidth 5.0
#define kThumbRadius 12.0

NS_ASSUME_NONNULL_BEGIN

@interface CircleSlider : UIControl

@property (nonatomic, assign) float value;
@property (nonatomic, assign) float minimumValue;
@property (nonatomic, assign) float maximumValue;
@property (nonatomic, strong) UIColor *minimumTrackTintColor;
@property (nonatomic, strong) UIColor *maximumTrackTintColor;
@property (nonatomic, strong) UIColor *thumbTintColor;
@property (nonatomic, assign, getter=isContinuous) BOOL continuous;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, assign) CGPoint thumbCenterPoint;


- (void)setup;
- (BOOL)isPointInThumb:(CGPoint)point;
- (CGFloat)sliderRadius;
- (void)drawThumbAtPoint:(CGPoint)sliderButtonCenterPoint inContext:(CGContextRef)context;
- (CGPoint)drawCircleTrack:(float)track atPoint:(CGPoint)center withRadius:(CGFloat)radius inContext:(CGContextRef)context;

@end

NS_ASSUME_NONNULL_END
