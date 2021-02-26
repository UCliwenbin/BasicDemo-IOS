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
#import "Person.h"
#import <objc/message.h>

@interface ViewController ()

@property (nonatomic, strong) ShowTextView *textView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIView *customView;
@property (nonatomic, strong) Slider *slider;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, weak) UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self);
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.testView = redView;
    [self.view addSubview:self.textView];
    self.slider = [[Slider alloc] initWithFrame:CGRectMake(10, 100, 300, 20)];
    self.slider.minimumValue = 0.f;
    self.slider.maximumValue = 100.f;
    self.slider.center = self.view.center;
    [self.view addSubview:self.slider];
    self.customView = [[UIView alloc] initWithFrame:CGRectMake(20, 300, 200, 200)];
    [self.view addSubview:self.customView];
    self.customView.backgroundColor = [UIColor greenColor];
    [self.customView addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)]];
}

- (void)longPressAction:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(moveMethod) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

int count = 0;
- (void)moveMethod {
    NSLog(@"移动距离：%d",count++);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self executeDispatchBlock];
    NSLog(@"====%@",NSStringFromCGRect(self.testView.frame));
    Class MyClass = objc_allocateClassPair([NSObject class], "MyClass", 0);
    BOOL isSuccess = class_addIvar(MyClass, "test", sizeof(NSString *), 0, "@");
    isSuccess ? NSLog(@"变量添加成功") : NSLog(@"变量添加失败");
    class_addMethod(MyClass, @selector(addMethodForMyClass:),(IMP)addMethodForMyClass,"v@:@");
    
    id myObjc = [[MyClass alloc] init];
    NSLog(@"%@",myObjc);
    NSString *str = @"1212121";
    [myObjc setValue:str forKey:@"test"];
    [myObjc performSelector:@selector(addMethodForMyClass:) withObject:@"你好"];
}

void addMethodForMyClass(id self,SEL _cmd, NSString *str) {
    Ivar ivar = class_getInstanceVariable([self class], "test");
    id obj = object_getIvar(self, ivar);
    NSLog(@"%@",obj);
    NSLog(@"addMethodForMyClass:参数：%@",str);
    NSLog(@"ClassName：%@",NSStringFromClass([self class]));
    
}



- (void)executeDispatchBlock {
    dispatch_queue_t queue = dispatch_queue_create("com.lwb.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        NSLog(@"执行我啊----%@",[NSThread currentThread]);
    });
    NSLog(@"当前线程----%@",[NSThread currentThread]);

    NSLog(@"执行完毕！");
}


- (ShowTextView *)textView {
    if (!_textView) {
        _textView = [[ShowTextView alloc] initWithFrame:CGRectZero];
    }
    return _textView;
}


@end
