//
//  ViewController.m
//  TextSlider
//
//  Created by mac on 2020/2/18.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "ViewController.h"
#import "ShowTextView.h"
#import "Slider.h"

@interface ViewController ()

@property (nonatomic, strong) ShowTextView *textView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIView *customView;
@property (nonatomic, strong) Slider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.textView];
    self.slider = [[Slider alloc] initWithFrame:CGRectMake(10, 100, 200, 20)];
    self.slider.minimumValue = 0.f;
    self.slider.maximumValue = 100.f;
    self.slider.center = self.view.center;
    [self.view addSubview:self.slider];
    
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%@",NSStringFromClass(self.class));
}

- (void)clickAction {
    NSLog(@"点击了我----button");
}

- (ShowTextView *)textView {
    if (!_textView) {
        _textView = [[ShowTextView alloc] initWithFrame:CGRectZero];
    }
    return _textView;
}


@end
