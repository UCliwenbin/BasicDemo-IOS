//
//  Slider.m
//  RangeSlider
//
//  Created by mac on 2020/2/3.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "Slider.h"

static CGFloat const kREDHandleTapTargetRadius = 20.0;

@interface Slider ()


@end

@implementation Slider

- (void)setLeftValue:(CGFloat)leftValue {
    if (leftValue <= self.minValue) {
        _leftValue = self.minValue;
    }
    else if (leftValue >= self.minValue && leftValue <= self.rightValue - self.minimumSpacing) {
        
        _leftValue = leftValue;
    }
    
    [self setNeedsLayout];
}

- (void)setRightValue:(CGFloat)rightValue {
    if (rightValue >= self.maxValue) {
        _rightValue = self.maxValue;
    }
    else if (rightValue <= self.maxValue && rightValue > self.leftValue + self.minimumSpacing) {
        
        _rightValue = rightValue;
    }
    
    [self setNeedsLayout];
}

- (void)setMaxValue:(CGFloat)maxValue {
    _maxValue = maxValue;
    [self setNeedsLayout];
}

- (void)setMinValue:(CGFloat)minValue {
    _minValue = minValue;
    [self setNeedsLayout];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}


- (void)customInit {
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureHappen:)];
    panGestureRecognizer.maximumNumberOfTouches = panGestureRecognizer.minimumNumberOfTouches;
    [self addGestureRecognizer:panGestureRecognizer];
}

- (void)panGestureHappen:(UIPanGestureRecognizer *)gesture {
    
}

- (void)layoutSubviews {
    if (!_didSetup) {
        [self setup];
        _didSetup = YES;
    }
    self.sliderBackground.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.sliderBackground.frame));
    self.sliderBackground.center = CGPointMake(floorf(CGRectGetWidth(self.bounds)/2), floorf(CGRectGetHeight(self.bounds)/2));
    
    CGFloat oneHundredPercent = self.maxValue - self.minValue;
    CGFloat leftValuePercentage = self.leftValue / oneHundredPercent;
    CGFloat leftXCoor = floorf((self.trackWidth - self.handleImage.size.width) * leftValuePercentage);
    
    self.leftHandle.frame = CGRectMake(0, 0, CGRectGetWidth(self.leftHandle.frame), CGRectGetHeight(self.leftHandle.frame));
    self.leftHandle.center = CGPointMake(leftXCoor, self.sliderBackground.center.y);
    
    CGFloat rightValuePercentage = self.rightValue / oneHundredPercent;
    CGFloat rightXCoor = floorf((self.trackWidth-self.handleImage.size.width) * rightValuePercentage) + self.handleImage.size.width;
    self.rightHandle.frame = CGRectMake(0, 0, CGRectGetWidth(self.rightHandle.frame), CGRectGetHeight(self.rightHandle.frame));
    self.rightHandle.center = CGPointMake(rightXCoor, self.sliderBackground.center.y);
//    // Fill
    CGFloat fillBackgroundWidth = self.rightHandle.center.x-self.leftHandle.center.x;
    self.sliderFillBackground.frame = CGRectMake(self.leftHandle.center.x, 0, fillBackgroundWidth, CGRectGetHeight(self.sliderFillBackground.frame));
    self.sliderFillBackground.center = CGPointMake(self.sliderFillBackground.center.x, self.sliderBackground.center.y);
}

- (void)setup {
    if (self.maxValue == 0) {
        self.maxValue = 50.f;
    }
    
    if (self.rightValue == 0) {
        self.rightValue = self.maxValue;
    }
    CGRect paddedFrame = self.frame;
    paddedFrame.size.height = kREDHandleTapTargetRadius * 2;
    self.frame = paddedFrame;
    
    self.sliderBackground = [[UIImageView alloc] initWithImage:self.trackBackgroundImage];
    [self addSubview:self.sliderBackground];
    
    self.sliderFillBackground = [[UIImageView alloc] initWithImage:self.trackFillImage];
    [self addSubview:self.sliderFillBackground];
    
    self.leftHandle = [[UIImageView alloc] initWithImage:self.leftHandleImage];
    [self addSubview:self.leftHandle];
    self.leftHandle.frame = CGRectMake(0, 0, self.rightHandleImage.size.width+kREDHandleTapTargetRadius, self.rightHandleImage.size.height+kREDHandleTapTargetRadius);
    self.leftHandle.contentMode = UIViewContentModeCenter;
    self.leftHandle.userInteractionEnabled = YES;
    UIPanGestureRecognizer *leftPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(leftHandlePanEngadged:)];
       leftPanGesture.delegate = self;
    [self.leftHandle addGestureRecognizer:leftPanGesture];
    
    self.rightHandle = [[UIImageView alloc] init];
    self.rightHandle.image = self.rightHandleImage;
    self.rightHandle.frame = CGRectMake(0, 0, self.rightHandleImage.size.width+kREDHandleTapTargetRadius, self.rightHandleImage.size.height+kREDHandleTapTargetRadius);
    self.rightHandle.contentMode = UIViewContentModeCenter;
    self.rightHandle.userInteractionEnabled = YES;
    [self addSubview:self.rightHandle];
    UIPanGestureRecognizer *rightPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(rightHandlePanEngadged:)];
    rightPanGesture.delegate = self;
    [self.rightHandle addGestureRecognizer:rightPanGesture];
    
}

- (UIImage *)handleImage {
    if(!_handleImage) {
        UIImage *image = [UIImage imageNamed:@"3.png"];
        _handleImage = image;
    }
    return _handleImage;
}

- (UIImage *)leftHandleImage {
    if (!_leftHandleImage) {
        return [self handleImage];
    }
    return _leftHandleImage;
}

- (UIImage *)rightHandleImage {
    if (!_rightHandleImage) {
        return [self handleImage];
    }
    return _rightHandleImage;
}

- (UIImage *)trackBackgroundImage {
    if (!_trackBackgroundImage) {
        _trackBackgroundImage = [[UIImage imageNamed:@"1.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(4, 5, 4, 5) resizingMode:(UIImageResizingModeStretch)];
    }
    return _trackBackgroundImage;
}

- (UIImage *)trackFillImage {
    if(!_trackFillImage) {
        UIImage *image = [[UIImage imageNamed:@"2.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(4, 5, 4, 5)];
        _trackFillImage = image;
    }
    return _trackFillImage;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    for (UIView *subView in self.subviews) {
        
        UIView *hitView = [subView hitTest:[self convertPoint:point toView:subView] withEvent:event];
        if (hitView) {
            return hitView;
        }
    }
    
    return [super hitTest:point withEvent:event];
}

- (CGFloat)trackWidth {
    
    return self.frame.size.width;
}

- (CGFloat)roundValueToStepValue:(CGFloat)value {
    if (self.stepValue == 0.0) {
        return value;
    }
    return self.stepValue * floor((value/self.stepValue)+0.5);
}

- (void)leftHandlePanEngadged:(UIGestureRecognizer *)gesture {
    UIPanGestureRecognizer *panGesture = (UIPanGestureRecognizer *)gesture;
    if (panGesture.state == UIGestureRecognizerStateChanged) {
        CGPoint pointInView = [panGesture translationInView:self];
        CGFloat oneHundredPercentOfValues = self.maxValue - self.minValue;
        CGFloat trackOneHundredPercent = self.trackWidth-self.handleImage.size.width;
        CGFloat trackPercentageChange = (pointInView.x / trackOneHundredPercent);
        self.leftValue += trackPercentageChange * oneHundredPercentOfValues;
        [panGesture setTranslation:CGPointZero inView:self];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
    else if (panGesture.state == UIGestureRecognizerStateCancelled ||
             panGesture.state == UIGestureRecognizerStateEnded) {
       
        self.leftValue = [self roundValueToStepValue:self.leftValue];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
    
}
- (void)rightHandlePanEngadged:(UIGestureRecognizer *)gesture {
    
    UIPanGestureRecognizer *panGesture = (UIPanGestureRecognizer *)gesture;
    
    if (panGesture.state == UIGestureRecognizerStateChanged) {
        
        CGPoint pointInView = [panGesture translationInView:self];
        CGFloat oneHundredPercentOfValues = self.maxValue - self.minValue;
        
        CGFloat trackOneHundredPercent = self.trackWidth-self.handleImage.size.width;
        CGFloat trackPercentageChange = (pointInView.x / trackOneHundredPercent)*100;
        
        self.rightValue += (trackPercentageChange/100.0) * oneHundredPercentOfValues;
        
        [panGesture setTranslation:CGPointZero inView:self];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
    else if (panGesture.state == UIGestureRecognizerStateCancelled ||
             panGesture.state == UIGestureRecognizerStateEnded ||
             panGesture.state == UIGestureRecognizerStateCancelled) {
        self.rightValue = [self roundValueToStepValue:self.rightValue];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

@end
