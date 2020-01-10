//
//  ViewController.m
//  ShinyButton
//
//  Created by mac on 2020/1/9.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "ViewController.h"
#import "ShinyButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ShinyButton *button = [[ShinyButton alloc] initWithFrame:CGRectMake(10, 100, 100, 50) withBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:button];
}


@end
