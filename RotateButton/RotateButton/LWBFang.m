//
//  LWBFang.m
//  RotateButton
//
//  Created by mac on 2020/1/18.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "LWBFang.h"

#define kRotationDuration 5

@interface LWBFang ()

@end

@implementation LWBFang


- (void)play {
    self.isPlay = YES;
}

- (void)pause {
    self.isPlay = NO;
}

- (void)drawRect:(CGRect)rect {
    [self initJingRound];
}

-(void) initJingRound2
{
    CGPoint center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
    self.clipsToBounds = YES;
    self.userInteractionEnabled = YES;
    
    self.layer.cornerRadius = center.x;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [[UIColor grayColor] CGColor];
    
    self.layer.shadowColor = UIColor.blackColor.CGColor;
    self.layer.shadowRadius = 2;
    self.layer.shadowOpacity = 0.6;
    self.layer.shadowOffset = CGSizeMake(0, 1);
    
    UIImage *roundImage = self.roundImage;
    self.roundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.roundImageView setCenter:center];
    [self.roundImageView setImage:roundImage];
    [self addSubview:self.roundImageView];
    UIImage *stateImage;
    if (self.isPlay) {
        stateImage = [UIImage imageNamed:@"pause"];
    }else{
        stateImage = [UIImage imageNamed:@"play"];
    }
    
    self.playStateView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, stateImage.size.width, stateImage.size.height)];
    [self.playStateView setCenter:center];
    [self.playStateView setImage:stateImage];
    [self addSubview:self.playStateView];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context=CGBitmapContextCreate(nil, self.frame.size.width, self.frame.size.height, 8.0, self.frame.size.width*4, colorSpace, kCGImageAlphaPremultipliedLast|kCGBitmapByteOrder32Big);
    CFRelease(colorSpace);
    
    CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:0.1 green:1.0 blue:0.0 alpha:0.7] CGColor]);
    CGContextBeginPath(context);
    CGContextAddArc(context, center.x, center.y, center.x , 0, 2 * M_PI, 0);
    CGContextClosePath(context);
    CGContextSetLineWidth(context, 15.0);
    CGContextStrokePath(context);
    CGImageRef image = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    UIImage* image2 = [UIImage imageWithCGImage:image];
    UIImageView *imgv =[[UIImageView alloc] initWithFrame:CGRectMake(0,0, self.frame.size.width , self.frame.size.height)];
    imgv.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
   imgv.image = image2;
    [self addSubview:imgv];
    CABasicAnimation* rotationAnimation;
   
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    
    if (self.rotationDuration == 0) {
        self.rotationDuration = kRotationDuration;
    }
    
    rotationAnimation.duration = self.rotationDuration;
    rotationAnimation.RepeatCount = FLT_MAX;
    rotationAnimation.cumulative = NO;
    [self.roundImageView.layer addAnimation:rotationAnimation forKey:nil];
    if (!self.isPlay) {
        self.layer.speed = 0.0;
    }
}

- (void)initJingRound {
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    self.clipsToBounds = YES;
    self.userInteractionEnabled = YES;
    self.layer.cornerRadius = center.x;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowRadius = 2;
    self.layer.shadowOpacity = 0.6;
    self.layer.shadowOffset = CGSizeMake(0, 1);
    
    UIImage *roundImage = self.roundImage;
    self.roundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.roundImageView.center = center;
    [self.roundImageView setImage:roundImage];
    [self addSubview:self.roundImageView];
    
    UIImage *stateImage;
    if (self.isPlay) {
        stateImage = [UIImage imageNamed:@"pause"];
    } else {
        stateImage = [UIImage imageNamed:@"play"];
    }
    self.playStateView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,50,50)];
    [self.playStateView setCenter:center];
    [self.playStateView setImage:stateImage];
    [self addSubview:self.playStateView];
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(nil, self.frame.size.width, self.frame.size.height, 8.0, self.frame.size.width*4, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CFRelease(colorSpace);
    
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:1 green:0 blue:0.0 alpha:0.7].CGColor);
    CGContextBeginPath(context);
    CGContextAddArc(context, center.x, center.y, center.x , 0, 2 * M_PI, 0);
    CGContextClosePath(context);
    CGContextSetLineWidth(context, 15.0);
    CGContextStrokePath(context);
    
    CGImageRef image = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    UIImage *image2 = [UIImage imageWithCGImage:image];
    UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    imgv.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    imgv.image = image2;
    [self addSubview:imgv];
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(M_PI*2);
    if (self.rotationDuration == 0) {
        self.rotationDuration = kRotationDuration;
    }
    rotationAnimation.duration = self.rotationDuration;
    rotationAnimation.repeatCount = FLT_MAX;
    rotationAnimation.cumulative = NO;
    [self.roundImageView.layer addAnimation:rotationAnimation forKey:nil];
    if (!self.isPlay) {
        self.layer.speed = 0.0;
    }
}

- (void)setIsPlay:(BOOL)isPlay {
    _isPlay = isPlay;
    if (self.isPlay) {
        [self startRotation];
    } else {
        [self pauseRotation];
    }
}

- (void)setRoundImage:(UIImage *)roundImage {
    _roundImage = roundImage;
    self.roundImageView.image = roundImage;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.isPlay = !self.isPlay;
}

- (void)startRotation {
    CFTimeInterval pausedTime = [self.layer timeOffset];
    self.layer.speed = 1.0;
    self.layer.timeOffset = 0.0;
    self.layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.layer.beginTime = timeSincePause;
    self.playStateView.image = [UIImage imageNamed:@"play"];
    self.playStateView.alpha = 0;
    [UIView animateWithDuration:1 animations:^{
        self.playStateView.alpha = 1;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:1.0 animations:^{
                self.playStateView.alpha = 0;
            }];
        }
    }];
    
}

- (void)pauseRotation {
    self.playStateView.image = [UIImage imageNamed:@"pause"];
    self.playStateView.alpha = 0;
    [UIView animateWithDuration:1 animations:^{
        self.playStateView.alpha = 1;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:1.0 animations:^{
                self.playStateView.alpha = 0;
                CFTimeInterval pauseTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
                self.layer.speed = 0.0;
                self.layer.timeOffset = pauseTime;
            }];
        }
    }];
}

@end
