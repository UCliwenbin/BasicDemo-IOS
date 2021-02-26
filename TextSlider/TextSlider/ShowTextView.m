//
//  ShowTextView.m
//  TextSlider
//
//  Created by mac on 2020/2/18.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "ShowTextView.h"

@implementation ShowTextView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textLabel = [[UILabel alloc] init];
        self.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont systemFontOfSize:13.f];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.adjustsFontSizeToFitWidth = YES;
        self.opaque = NO;
        [self addSubview:self.textLabel];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    CGFloat y = (frame.size.height -26) / 3;
    if (frame.size.height < 38) {
        y = 0;
    }
    self.textLabel.frame = CGRectMake(0, y, frame.size.width, 26);
}

- (void)drawRect:(CGRect)rect {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *gradientColor = [UIColor grayColor];
    UIColor *gradientColor2 = [UIColor darkGrayColor];
    NSArray *gradientColors = @[(id)gradientColor.CGColor,(id)gradientColor2.CGColor];
    CGFloat gradientLocations[] = {0,1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    CGRect frame = self.bounds;
    CGRect frame2 = CGRectMake(CGRectGetMinX(frame)+floor((CGRectGetWidth(frame)-11)*0.51724+0.5),CGRectGetMinY(frame)+CGRectGetHeight(frame)-9 ,11, 9);
    //绘制贝塞尔曲线
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMaxX(frame) - 0.5, CGRectGetMinY(frame) + 4.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 0.5, CGRectGetMaxY(frame) - 11.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 4.5, CGRectGetMaxY(frame) - 7.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 0.5, CGRectGetMaxY(frame) - 9.29) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 2.29, CGRectGetMaxY(frame) - 7.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 10.64, CGRectGetMinY(frame2) + 1.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 5.5, CGRectGetMinY(frame2) + 8)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 0.36, CGRectGetMinY(frame2) + 1.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 4.5, CGRectGetMaxY(frame) - 7.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.5, CGRectGetMaxY(frame) - 11.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 2.29, CGRectGetMaxY(frame) - 7.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.5, CGRectGetMaxY(frame) - 9.29)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.5, CGRectGetMinY(frame) + 4.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 4.5, CGRectGetMinY(frame) + 0.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.5, CGRectGetMinY(frame) + 2.29) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 2.29, CGRectGetMinY(frame) + 0.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 4.5, CGRectGetMinY(frame) + 0.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 0.5, CGRectGetMinY(frame) + 4.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 2.29, CGRectGetMinY(frame) + 0.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 0.5, CGRectGetMinY(frame) + 2.29)];
    [bezierPath closePath];
    CGContextSaveGState(context);
    [bezierPath addClip];
    CGRect bezierBounds = bezierPath.bounds;
    CGContextDrawLinearGradient(context,gradient,CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMinY(bezierBounds)), CGPointMake(CGRectGetMidX(bezierBounds),CGRectGetMaxY(bezierBounds)),0);
    CGContextRestoreGState(context);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

@end
