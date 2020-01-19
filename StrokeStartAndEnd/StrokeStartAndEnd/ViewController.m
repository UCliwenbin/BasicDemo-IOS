//
//  ViewController.m
//  StrokeStartAndEnd
//
//  Created by mac on 2020/1/10.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@property (nonatomic, strong) TestView *animView;
@property (nonatomic, strong) CAShapeLayer *animLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animView = [[TestView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.animView.center = self.view.center;
    [self.view addSubview:self.animView];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:50 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    self.animLayer = [CAShapeLayer layer];
    self.animLayer.path = path.CGPath;
    self.animLayer.fillColor = [UIColor whiteColor].CGColor;
    self.animLayer.strokeColor = [UIColor greenColor].CGColor;
    self.animLayer.lineWidth = 10.f;
    self.animLayer.speed = 0;
    [self.view.layer addSublayer:self.animLayer];
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    anim.duration = 2;
    anim.fromValue = @(0);
    anim.toValue = @(1);
    [self.animLayer addAnimation:anim forKey:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 repeats:YES block:^(NSTimer * _Nonnull timer) {
         CFTimeInterval timeOffset = self.animLayer.timeOffset;
         timeOffset = MIN(1.9999, MAX(0.0, timeOffset + 0.05));
         NSLog(@"timeOffset2==%f",timeOffset);
         self.animLayer.timeOffset = timeOffset;
//        if (timeOffset == 0.9999) {
//            [timer invalidate];
//        }
    }];
}



@end
