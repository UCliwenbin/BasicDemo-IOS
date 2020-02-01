//
//  ViewController.m
//  CircleSlider
//
//  Created by mac on 2020/1/29.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "ViewController.h"
#import "CircleSlider.h"

@interface ViewController ()

@property (nonatomic, strong) CircleSlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.slider = [[CircleSlider alloc] initWithFrame:CGRectMake(10, 10, 200, 200)];
    [self.view addSubview:self.slider];
    self.slider.backgroundColor = [UIColor orangeColor];
    [self.slider addTarget:self action:@selector(updateProgress:) forControlEvents:(UIControlEventValueChanged)];
    [self.slider setMinimumValue:0];
    [self.slider setMaximumValue:1];
    
}

- (void)updateProgress:(CircleSlider *)slider {
    
}


@end
