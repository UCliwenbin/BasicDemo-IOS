//
//  ViewController.m
//  弹出式按钮
//
//  Created by Love on 13-10-18.
//  Copyright (c) 2013年 Love. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.view.frame = CGRectMake(0, 0, 320, 460);
    self.view.backgroundColor = [UIColor cyanColor];
    Button *dcPathButton = [[Button alloc]
                                  initDCPathButtonWithSubButtons:3
                                  totalRadius:60
                                  centerRadius:15
                                  subRadius:15
                                  centerImage:@"button2.png"
                                  centerBackground:nil
                                  subImages:^(Button *dc){
                                      [dc subButtonImage:@"button1.png" withTag:0];
                                      [dc subButtonImage:@"button3.png" withTag:1];
                                      [dc subButtonImage:@"button4.png" withTag:2];
                                  }
                                  subImageBackground:nil
                                  inLocationX:0 locationY:0 toParentView:self.view];
    dcPathButton.delegate = self;

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)button_0_action{
    UIAlertView *A=[[UIAlertView alloc]initWithTitle:@"你选择的是“电话”按钮" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [A show];
}
- (void)button_1_action{
    UIAlertView *A=[[UIAlertView alloc]initWithTitle:@"你选择的是“快进”按钮" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [A show];
}
- (void)button_2_action{
    UIAlertView *A=[[UIAlertView alloc]initWithTitle:@"你选择的是“删除”按钮" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [A show];
}


@end
