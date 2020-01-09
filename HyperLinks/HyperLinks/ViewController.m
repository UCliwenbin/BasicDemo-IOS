//
//  ViewController.m
//  HyperLinks
//
//  Created by mac on 2020/1/6.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "ViewController.h"

#import "HyperLinkButton.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HyperLinkButton *button = [HyperLinkButton buttonWithType:UIButtonTypeSystem];
    [button setLinkColor:[UIColor blueColor]];
//    [button setIsHighlight:YES];
    [button setTitle:@"www.baidu.com" forState:(UIControlStateNormal)];
    button.frame = CGRectMake(100, 100, 200, 100);
    [self.view addSubview:button];
}


@end
