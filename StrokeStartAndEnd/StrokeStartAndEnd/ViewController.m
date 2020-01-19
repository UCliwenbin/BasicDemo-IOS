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
}


@end
