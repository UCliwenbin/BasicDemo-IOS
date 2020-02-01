//
//  CircleSlider.m
//  CircleSlider
//
//  Created by mac on 2020/1/29.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "CircleSlider.h"

float translateValueFromSourceIntervalToDestinationInterval(float sourceValue, float sourceIntervalMinimum, float sourceIntervalMaximum, float destinationIntervalMinimum, float destinationIntervalMaximum) {
    float a, b, destinationValue;
    
    a = (destinationIntervalMaximum - destinationIntervalMinimum) / (sourceIntervalMaximum - sourceIntervalMinimum);
    b = destinationIntervalMaximum - a*sourceIntervalMaximum;
    
    destinationValue = a*sourceValue + b;
    
    return destinationValue;
}

CGFloat angleBetweenThreePoints(CGPoint centerPoint, CGPoint p1, CGPoint p2) {
    CGPoint v1 = CGPointMake(p1.x - centerPoint.x, p1.y - centerPoint.y);
    CGPoint v2 = CGPointMake(p2.x - centerPoint.x, p2.y - centerPoint.y);
    
    CGFloat angle = atan2f(v2.x*v1.y - v1.x*v2.y, v1.x*v2.x + v1.y*v2.y);
    
    return angle;
    
}

@implementation CircleSlider

- (void)setValue:(float)value {
    if (value != _value) {
        if (value > self.maximumValue) { value = self.maximumValue; }
        if (value < self.minimumValue) { value = self.minimumValue; }
        _value = value;
        [self setNeedsDisplay];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}
- (void)setMinimumValue:(float)minimumValue {
    if (minimumValue != _minimumValue) {
        _minimumValue = minimumValue;
        if (self.maximumValue < self.minimumValue)    { self.maximumValue = self.minimumValue; }
        if (self.value < self.minimumValue)            { self.value = self.minimumValue; }
    }
}

- (void)setMaximumValue:(float)maximumValue {
    if (maximumValue != _maximumValue) {
        _maximumValue = maximumValue;
        if (self.minimumValue > self.maximumValue)    { self.minimumValue = self.maximumValue; }
        if (self.value > self.maximumValue)            { self.value = self.maximumValue; }
    }
}
- (void)setMinimumTrackTintColor:(UIColor *)minimumTrackTintColor {
    if (![minimumTrackTintColor isEqual:_minimumTrackTintColor]) {
        _minimumTrackTintColor = minimumTrackTintColor;
        [self setNeedsDisplay];
    }
}
- (void)setMaximumTrackTintColor:(UIColor *)maximumTrackTintColor {
    if (![maximumTrackTintColor isEqual:_maximumTrackTintColor]) {
        _maximumTrackTintColor = maximumTrackTintColor;
        [self setNeedsDisplay];
    }
}
- (void)setThumbTintColor:(UIColor *)thumbTintColor {
    if (![thumbTintColor isEqual:_thumbTintColor]) {
        _thumbTintColor = thumbTintColor;
        [self setNeedsDisplay];
    }
}
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setup];
    }
    return self;
}

- (void)setup {
    self.value = 0;
    self.minimumValue = 0.0f;
    self.maximumValue = 1.0f;
    self.minimumTrackTintColor = [UIColor blueColor];
    self.maximumTrackTintColor = [UIColor greenColor];
    self.thumbTintColor = [UIColor redColor];
    self.continuous = YES;
    self.thumbCenterPoint = CGPointZero;
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureHappen:)];
    panGestureRecognizer.maximumNumberOfTouches = panGestureRecognizer.minimumNumberOfTouches;
    [self addGestureRecognizer:panGestureRecognizer];
    
}

- (void)panGestureHappen:(UIPanGestureRecognizer *)panGesture {
    CGPoint tapLocation = [panGesture locationInView:self];
    switch (panGesture.state) {
        case UIGestureRecognizerStateChanged:
        {
            CGFloat radius = [self sliderRadius];
            CGPoint sliderCenter = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
            CGPoint sliderStartPoint = CGPointMake(sliderCenter.x, sliderCenter.y-radius);
            CGFloat angle = angleBetweenThreePoints(sliderCenter, sliderStartPoint, tapLocation);
            if (angle < 0) {
                angle = -angle;
            } else {
                angle = 2 * M_PI - angle;
            }
            self.value = translateValueFromSourceIntervalToDestinationInterval(angle, 0, 2*M_PI, self.minimumValue, self.maximumValue);
        }
            break;
            
        default:
            break;
    }
}

- (BOOL)isPointInThumb:(CGPoint)point {
    CGRect thumbTouchRect = CGRectMake(self.thumbCenterPoint.x - kThumbRadius, self.thumbCenterPoint.y - kThumbRadius, kThumbRadius*2, kThumbRadius*2);
    return CGRectContainsPoint(thumbTouchRect, point);
}

- (CGPoint)drawCircleTrack:(float)track atPoint:(CGPoint)center withRadius:(CGFloat)radius inContext:(CGContextRef)context {
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    float angleFromTrack = translateValueFromSourceIntervalToDestinationInterval(track, self.minimumValue, self.maximumValue, 0, 2*M_PI);
    CGFloat startAngle = -M_PI_2;
    CGFloat endAngle = startAngle + angleFromTrack;
    CGContextAddArc(context,center.x, center.y, radius, startAngle, endAngle, NO);
    
    CGPoint arcEndPoint = CGContextGetPathCurrentPoint(context);
    
    CGContextStrokePath(context);
    UIGraphicsPopContext();
    
    return arcEndPoint;
}

- (void)drawThumbAtPoint:(CGPoint)sliderButtonCenterPoint inContext:(CGContextRef)context {
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, sliderButtonCenterPoint.x, sliderButtonCenterPoint.y);
    CGContextAddArc(context, sliderButtonCenterPoint.x, sliderButtonCenterPoint.y, kThumbRadius, 0.0, 2*M_PI, NO);
    CGContextFillPath(context);
    UIGraphicsPopContext();
}

//获取半径
- (CGFloat)sliderRadius {
    CGFloat radius = MIN(self.bounds.size.width/2, self.bounds.size.height/2);
    radius -= MAX(kLineWidth, kThumbRadius);
    return radius;
}

- (void)drawRect:(CGRect)rect {
     CGContextRef context = UIGraphicsGetCurrentContext();
     
     CGPoint middlePoint;
     middlePoint.x = self.bounds.origin.x + self.bounds.size.width/2;
     middlePoint.y = self.bounds.origin.y + self.bounds.size.height/2;
     CGContextSetLineWidth(context, kLineWidth);
     CGFloat radius = [self sliderRadius];
     [self.maximumTrackTintColor setStroke];
     [self drawCircleTrack:self.maximumValue atPoint:middlePoint withRadius:radius inContext:context];
     [self.minimumTrackTintColor setStroke];
     self.thumbCenterPoint = [self drawCircleTrack:self.value atPoint:middlePoint withRadius:radius inContext:context];
     [self.thumbTintColor setFill];
     [self drawThumbAtPoint:self.thumbCenterPoint inContext:context];
    
}

@end
