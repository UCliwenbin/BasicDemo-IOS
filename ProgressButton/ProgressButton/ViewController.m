//
//  ViewController.m
//  ProgressButton
//
//  Created by mac on 2020/1/9.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "ViewController.h"
#import "ProgressPlay.h"
#import "ProgressView.h"

@interface ViewController ()<ProgressPlayDelegate>

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) ProgressView *progressView;
@property (nonatomic, strong) ProgressPlay *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.progressView = [[ProgressView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:self.progressView];
    self.progressView.center = self.view.center;
    
    self.player = [[ProgressPlay alloc] init];
    self.player.delegate = self;
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:self.button];
    self.button.center = self.view.center;
    [self.button addTarget:self action:@selector(playPauseButton:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.button setBackgroundImage:[UIImage imageNamed:@"start"] forState:(UIControlStateNormal)];
    
    UIColor *tintColor = [UIColor greenColor];
    [self.progressView setTintColor:tintColor];
    self.progressView.trackColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    self.progressView.startAngle = 3*M_PI/2;
    
}

- (void)playPauseButton:(UIButton *)button {
    if (button.selected) {
        button.selected = NO;
        [self.player pause];
        [button setBackgroundImage:[UIImage imageNamed:@"pause"] forState:(UIControlStateNormal)];
    } else {
        button.selected = YES;
        [self.player play];
        [self.button setBackgroundImage:[UIImage imageNamed:@"start"] forState:(UIControlStateNormal)];
    }
}


- (void)player:(ProgressPlay *)player didReachPosition:(float)position {
    self.progressView.progress = position;
}

- (void)playerDidStop:(ProgressPlay *)player {
    self.button.selected = NO;
    self.progressView.progress = 0.0f;
}


@end
