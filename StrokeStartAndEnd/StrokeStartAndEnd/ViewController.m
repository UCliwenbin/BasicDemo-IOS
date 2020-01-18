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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animView = [[TestView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.animView.center = self.view.center;
    [self.view addSubview:self.animView];
    
    UIView* aView = [[UIView alloc] initWithFrame:CGRectMake(100,80, 100, 100)];
     [self.view addSubview:aView];
     //用来标识layer的绘图是否正确
     aView.layer.borderWidth = 1.0;
     aView.layer.borderColor = [UIColor blackColor].CGColor;
     CAShapeLayer* cropLayer = [[CAShapeLayer alloc] init];
     [aView.layer addSublayer:cropLayer];
     // 创建一个绘制路径
     CGMutablePathRef path =CGPathCreateMutable();
     // 空心矩形的rect
     CGRect cropRect = CGRectMake(20, 30, 60, 40);
     // 绘制rect
     CGPathAddRect(path, nil, aView.bounds);
     CGPathAddRect(path, nil, cropRect);
     // 设置填充规则(重点)
     [cropLayer setFillRule:kCAFillRuleEvenOdd];
     // 关联绘制的path
     [cropLayer setPath:path];
     // 设置填充的颜色
     [cropLayer setFillColor:[[UIColor redColor] CGColor]];
}


@end
