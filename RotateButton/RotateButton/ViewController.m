//
//  ViewController.m
//  RotateButton
//
//  Created by mac on 2020/1/18.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "ViewController.h"
#import "LWBFang.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet LWBFang *roundView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.roundView.roundImage = [UIImage imageNamed:@"dog"];
    self.roundView.rotationDuration = 8.f;
    self.roundView.isPlay = NO;
    
}


@end
