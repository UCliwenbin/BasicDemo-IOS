//
//  ProgressView.m
//  ProgressButton
//
//  Created by mac on 2020/1/9.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

+ (Class)layerClass {
    return [ProgressLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initIVars];
    }
    return self;
}

- (void) _initIVars {
    self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;
    self.tintColor = [UIColor colorWithRed:0.2 green:0.45 blue:0.8 alpha:1.0];
    self.trackColor = [UIColor whiteColor];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated {
    if (progress < 0.f) {
        progress = 0.f;
    }
    
    if (progress > 1.f) {
        progress = 1.f;
    }
    
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    if (animated) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
        animation.duration = 0.25;
        animation.fromValue = [NSNumber numberWithFloat:layer.progress];
        animation.toValue = [NSNumber numberWithFloat:progress];
        [layer addAnimation:animation forKey:@"progressAnimation"];
        layer.progress = progress;
    } else {
        layer.progress = progress;
        [layer setNeedsDisplay];
    }
}

- (void)setProgress:(CGFloat)progress {
    [self setProgress:progress animated:YES];
}

- (void)setTintColor:(UIColor *)tintColor {
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    layer.tintColor = tintColor;
    [layer setNeedsDisplay];
}

- (void)setTrackColor:(UIColor *)trackColor {
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    layer.trackColor = trackColor;
    [layer setNeedsDisplay];
}

- (void)setStartAngle:(CGFloat)startAngle {
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    layer.startAngle = startAngle;
    [layer setNeedsDisplay];
}

@end
