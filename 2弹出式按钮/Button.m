//
//  Button.m
//  弹出式按钮
//
//  Created by Love on 13-10-18.
//  Copyright (c) 2013年 Love. All rights reserved.
//

#import "Button.h"

@implementation Button

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

@synthesize delegate = _delegate;
@synthesize expanded = _expanded;
@synthesize buttonCount = _buttonCount;

@synthesize totalRaiuds = _totalRaiuds;
@synthesize centerRadius = _centerRadius;
@synthesize subRadius = _subRadius;
@synthesize centerLocationAxisX = _centerLocationAxisX;
@synthesize centerLocationAxisY = _centerLocationAxisY;

@synthesize parentView = _parentView;
@synthesize buttons = _buttons;
@synthesize centerButton, subButton;

static CGFloat const kDCPathButtonLeftOffSetX = -20.0f;
static CGFloat const kDCPathButtonRightOffSetX = 20.0f;
static CGFloat const kDCPathButtonVerticalOffSetX = 20.0f;


static CGFloat const kDCPathButtonAngel36C = 36.0f;
static CGFloat const kDCPathButtonAngel45C = 45.0f;
static CGFloat const kDCPathButtonAngel60C = 60.0f;
static CGFloat const kDCPathButtonAngel72C = 72.0f;
static CGFloat const kDCPathButtonDefaultCenterRadius = 15.0f;
static CGFloat const kDCPathButtonDefaultSubRadius = 20.0f;
static CGFloat const kDCPathButtonDefaultTotalRadius = 60.0f;
static CGFloat const kDCPathButtonDefaultRotation = M_PI*2;
static CGFloat const kDCPathButtonDefaultReverseRotation = -M_PI*2;


- (id)initDCPathButtonWithSubButtons:(NSInteger)buttonCount totalRadius:(CGFloat)totalRadius centerRadius:(NSInteger)centerRadius subRadius:(CGFloat)subRadius centerImage:(NSString *)centerImageName centerBackground:(NSString *)centerBackgroundName subImages:(void (^)(Button *))imageBlock subImageBackground:(NSString *)subImageBackgroundName inLocationX:(CGFloat)xAxis locationY:(CGFloat)yAxis toParentView:(UIView *)parentView{
    
    parentView == nil? (self.parentView = parentView):(self.parentView = parentView);
    xAxis == 0? (self.centerLocationAxisX = kDCPathButtonCurrentFrameWidth/2) : (self.centerLocationAxisX = xAxis);
    yAxis == 0? (self.centerLocationAxisY = kDCPathButtonCurrentFrameHeight/2) : (self.centerLocationAxisY = yAxis);
    self.buttonCount = buttonCount;
    self.totalRaiuds = totalRadius;
    self.subRadius = subRadius;
    _expanded = NO;
    kDCPathButtonSubButtonBirthLocation = CGPointMake(-kDCPathButtonCurrentFrameWidth/2, -kDCPathButtonCurrentFrameHeight/2);
    kDCPathButtonSubButtonFinalLocation = CGPointMake(self.centerLocationAxisX, self.centerLocationAxisY);
    
    if (self = [super initWithFrame:self.parentView.bounds]) {
        [self configureCenterButton:centerRadius image:centerImageName backgroundImage:centerBackgroundName];
        [self configureTheButtons:buttonCount];
        imageBlock(self);
        [self.parentView addSubview:self];
    }
    return self;
}

#pragma mark - configure the center button and the sub button

//centerRadius使用来确定大小的
- (void)configureCenterButton:(CGFloat)centerRadius image:(NSString *)imageName backgroundImage:(NSString *)backgroundImageName{
    self.centerButton = [[UIButton alloc]init];
    self.centerButton.frame = CGRectMake(0, 0, centerRadius * 2, centerRadius * 2);
    self.centerButton.center = CGPointMake(self.centerLocationAxisX, self.centerLocationAxisY);
    if (imageName == nil) {
        imageName = @"dc-center";
    }
    if (backgroundImageName == nil) {
        backgroundImageName = @"dc-background";
    }
    [self.centerButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.centerButton setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    [self.centerButton addTarget:self action:@selector(centerButtonPress) forControlEvents:UIControlEventTouchUpInside];
    self.centerButton.layer.zPosition = 1;
    [self addSubview:self.centerButton];
}

- (void)centerButtonPress{
    if (![self isExpanded]) {
        
        [self button:[self.buttons objectAtIndex:0] appearAt:kDCPathButtonSubButtonTag_0_AppearLocation withDalay:0.5 duration:0.35];
        [self button:[self.buttons objectAtIndex:1] appearAt:kDCPathButtonSubButtonTag_1_AppearLocation withDalay:0.55 duration:0.4];
        [self button:[self.buttons objectAtIndex:2] appearAt:kDCPathButtonSubButtonTag_2_AppearLocation withDalay:0.6 duration:0.45];
        self.expanded = YES;
        
        
    }else{
        [self button:[self.buttons objectAtIndex:0]
            shrinkAt:kDCPathButtonSubButtonTag_0_AppearLocation
         offsetAxisX:kDCPathButtonLeftOffSetX
         offSEtAxisY:[self offsetAxisY:kDCPathButtonLeftOffSetX withAngel:kDCPathButtonAngel60C]
           withDelay:0.4
     rotateDirection:kDCPathButtonRotationNormal animationDuration:1];
        [self button:[self.buttons objectAtIndex:1]
            shrinkAt:kDCPathButtonSubButtonTag_1_AppearLocation
         offsetAxisX:kDCPathButtonRightOffSetX
         offSEtAxisY:-[self offsetAxisY:kDCPathButtonRightOffSetX withAngel:kDCPathButtonAngel60C] withDelay:0.5
     rotateDirection:kDCPathButtonRotationReverse animationDuration:1.2];
        
        [self button:[self.buttons objectAtIndex:2]
            shrinkAt:kDCPathButtonSubButtonTag_2_AppearLocation
         offsetAxisX:0 offSEtAxisY:kDCPathButtonVerticalOffSetX
           withDelay:0.6
     rotateDirection:kDCPathButtonRotationNormal animationDuration:1.4];
        
        self.expanded = NO;
    }
}

- (void)configureTheButtons:(NSInteger)buttonCount{
    
    kDCPathButtonSubButtonTag_0_AppearLocation = CGPointMake(
                                                             self.centerLocationAxisX - self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)),
                                                             self.centerLocationAxisY - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)));
    kDCPathButtonSubButtonTag_1_AppearLocation = CGPointMake(
                                                             self.centerLocationAxisX + self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)),
                                                             self.centerLocationAxisY - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)));
    kDCPathButtonSubButtonTag_2_AppearLocation = CGPointMake(
                                                             self.centerLocationAxisX ,
                                                             self.centerLocationAxisY +self.totalRaiuds);
    
    
    self.buttons = [NSMutableArray array];
    for (NSInteger i = 0; i<3; i++) {
        subButton = [[but alloc]init];
        subButton.delegate = self;
        subButton.frame = CGRectMake(0, 0, self.subRadius * 2, self.subRadius * 2);
        subButton.center = kDCPathButtonSubButtonBirthLocation;
        NSString *imageFormat = [NSString stringWithFormat:@"dc-button_%d",i];
        [subButton setImage:[UIImage imageNamed:imageFormat] forState:UIControlStateNormal];
        
        [self addSubview:subButton];
        [self.buttons addObject:subButton];
    }
}

#pragma mark - Add image to sub button, only use in the block

- (void)subButtonImage:(NSString *)imageName withTag:(NSInteger)tag{
    if (tag > self.buttonCount) {
        tag = self.buttonCount;
    }
    but *currentButton = [self.buttons objectAtIndex:tag];
    [currentButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

#pragma mark - Set a sign to judge the animation state

- (BOOL)isExpanded{
    return _expanded;
}

#pragma mark - The center button and the sub button's animations

- (void)button:(but *)button appearAt:(CGPoint)location withDalay:(CGFloat)delay duration:(CGFloat)duration{
    button.center = location;
    button.layer.opacity = 1;
//    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animation];
    scaleAnimation.keyPath = @"transform";
    scaleAnimation.duration = duration;
    scaleAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3, 1.3, 1)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)]];
    scaleAnimation.calculationMode = kCAAnimationCubic;
    scaleAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0f],[NSNumber numberWithFloat:delay],[NSNumber numberWithFloat:1.0f]];
    button.layer.anchorPoint = CGPointMake(0.5f, 0.5f);
    [button.layer addAnimation:scaleAnimation forKey:@"buttonAppear"];
    
//    CABasicAnimation *opacityAnim = [CABasicAnimation animation];
//    opacityAnim.keyPath = @"opacity";
//    opacityAnim.fromValue = @(0);
//    opacityAnim.toValue = @(1);
//    opacityAnim.duration = duration;
//    [button.layer addAnimation:opacityAnim forKey:nil];
}

- (void)button:(but *)button shrinkAt:(CGPoint)location offsetAxisX:(CGFloat)axisX offSEtAxisY:(CGFloat)axisY withDelay:(CGFloat)delay rotateDirection:(DCPathButtonRotationOrientation)orientation animationDuration:(CGFloat)duration{
    
    CAKeyframeAnimation *rotation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.duration = duration * delay;
    rotation.values = @[[NSNumber numberWithFloat:0.0f],[NSNumber numberWithFloat:[self matchRotationOrientation:orientation]],[NSNumber numberWithFloat:0.0f]];
    rotation.keyTimes = @[[NSNumber numberWithFloat:0.0f],[NSNumber numberWithFloat:delay],[NSNumber numberWithFloat:1.0f]];
    
    CAKeyframeAnimation *shrink = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    shrink.duration = duration * (1 - delay);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, location.x, location.y);
    CGPathAddLineToPoint(path, NULL, location.x + axisX, location.y + axisY);
    CGPathAddLineToPoint(path, NULL, kDCPathButtonSubButtonFinalLocation.x, kDCPathButtonSubButtonFinalLocation.y);
    shrink.path = path;
    
    CGPathRelease(path);
    
    CAAnimationGroup *totalAnimation = [CAAnimationGroup animation];
    totalAnimation.duration = 1.0f;
    totalAnimation.animations = @[rotation,shrink];
    totalAnimation.fillMode = kCAFillModeForwards;
    totalAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    totalAnimation.delegate = self;
    
    button.layer.anchorPoint = CGPointMake(0.5f, 0.5f);
    button.center = kDCPathButtonSubButtonBirthLocation;
    [button.layer addAnimation:totalAnimation forKey:@"buttonDismiss"];
}




- (CGFloat)matchRotationOrientation:(DCPathButtonRotationOrientation)orientation{
    if (orientation == kDCPathButtonRotationNormal) {
        return kDCPathButtonDefaultRotation;
    }
    return kDCPathButtonDefaultReverseRotation;
}

- (CGFloat)offsetAxisY:(CGFloat)axisX withAngel:(CGFloat)angel{
    return (axisX / tanf(kDCCovertAngelToRadian(angel)));
}


#pragma DCSubButton Delegate

- (void)subButtonPress:(but *)button{
    if ([_delegate respondsToSelector:@selector(button_0_action)] &&
        button == [self.buttons objectAtIndex:0]) {
        [_delegate button_0_action];
    }
    else if ([_delegate respondsToSelector:@selector(button_1_action)] &&
             button == [self.buttons objectAtIndex:1]){
        [_delegate button_1_action];
    }
    else if ([_delegate respondsToSelector:@selector(button_2_action)] &&
             button == [self.buttons objectAtIndex:2]){
        [_delegate button_2_action];
    }
    
}


@end
