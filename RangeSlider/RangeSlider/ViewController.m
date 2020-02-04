//
//  ViewController.m
//  RangeSlider
//
//  Created by mac on 2020/2/3.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "ViewController.h"
#import "Slider.h"

@interface ViewController ()

@property (nonatomic, strong) Slider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.slider = [[Slider alloc] initWithFrame:CGRectMake(60, 60, 300, 200)];
    [self.view addSubview:self.slider];
    [self.slider addTarget:self action:@selector(sliderAction:) forControlEvents:(UIControlEventValueChanged)];
    
}

- (void)sliderAction:(Slider *)slider {
    NSLog(@"leftValue===%f,rightValue==%f",slider.leftValue,slider.rightValue);
}


@end
