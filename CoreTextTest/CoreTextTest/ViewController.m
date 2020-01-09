//
//  ViewController.m
//  CoreTextTest
//
//  Created by mac on 2018/7/11.
//  Copyright © 2018年 lwb. All rights reserved.
//

#import "ViewController.h"
#import "LWBCoreTextView.h"
#import "CTFrameParserConfig.h"
#import "CTFrameParser.h"
#import "UIView+frameAdjust.h"

@interface ViewController ()

@property (nonatomic, strong) LWBCoreTextView *coretextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.coretextView = [[LWBCoreTextView alloc] init];
    [self.view addSubview:self.coretextView];
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
    config.textColor = [UIColor blueColor];
    config.width = self.view.width;
//    NSMutableDictionary *attr = [CTFrameParser attributesWithConfig:config];
//    NSString *content =
//    @" 对于上面的例子，我们给 CTFrameParser 增加了一个将 NSString 转 "
//     " 换为 CoreTextData 的方法。"
//     " 但这样的实现方式有很多局限性，因为整个内容虽然可以定制字体 "
//     " 大小，颜色，行高等信息，但是却不能支持定制内容中的某一部分。"
//     " 例如，如果我们只想让内容的前三个字显示成红色，而其它文字显 "
//     " 示成黑色，那么就办不到了。"
//     "\n\n"
//     " 解决的办法很简单，我们让`CTFrameParser`支持接受 "
//     "NSAttributeString 作为参数，然后在 NSAttributeString 中设置好 "
//     " 我们想要的信息。";
//    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:content attributes:attr];
//    [attrStr addAttribute:(id)kCTForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 7)];
//    CoreTextData *data = [CTFrameParser parseContent:attrStr config:config];
//    self.coretextView.data = data;
//    self.coretextView.frame = CGRectMake(0, 100,self.view.width,data.height);
//    self.coretextView.backgroundColor = [UIColor yellowColor];
    
    NSBundle *thisBundle = [NSBundle mainBundle];
    NSString *filePath = [thisBundle pathForResource:@"charsetter" ofType:@"json"];
    CoreTextData *data = [CTFrameParser parseTemplateFile:filePath config:config];
    self.coretextView.data = data;
    self.coretextView.frame = CGRectMake(0, 100,self.view.width,data.height);
    self.coretextView.backgroundColor = [UIColor yellowColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
