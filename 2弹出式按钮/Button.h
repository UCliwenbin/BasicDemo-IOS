//
//  Button.h
//  弹出式按钮
//
//  Created by Love on 13-10-18.
//  Copyright (c) 2013年 Love. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "but.h"
#define kDCPathButtonParentView self.parentView
#define kDCPathButtonCurrentFrameWidth kDCPathButtonParentView.frame.size.width
#define kDCPathButtonCurrentFrameHeight kDCPathButtonParentView.frame.size.height

#define kDCCovertAngelToRadian(x) ((x)*M_PI)/180

typedef enum{
    kDCPathButtonRotationNormal = 0,
    kDCPathButtonRotationReverse,
}DCPathButtonRotationOrientation;

@protocol ButtonDelegate <NSObject>
@optional
- (void)button_0_action;
- (void)button_1_action;
- (void)button_2_action;
- (void)button_3_action;
- (void)button_4_action;
- (void)button_5_action;
@end


@interface Button : UIView<butDelegate>{
    CGPoint kDCPathButtonSubButtonBirthLocation;
    CGPoint kDCPathButtonSubButtonTag_0_AppearLocation;
    CGPoint kDCPathButtonSubButtonTag_1_AppearLocation;
    CGPoint kDCPathButtonSubButtonTag_2_AppearLocation;
    CGPoint kDCPathButtonSubButtonTag_3_AppearLocation;
    CGPoint kDCPathButtonSubButtonTag_4_AppearLocation;
    CGPoint kDCPathButtonSubButtonTag_5_AppearLocation;
    CGPoint kDCPathButtonSubButtonFinalLocation;

}
- (id)initDCPathButtonWithSubButtons:(NSInteger)buttonCount
                         totalRadius:(CGFloat)totalRadius
                        centerRadius:(NSInteger)centerRadius
                           subRadius:(CGFloat)subRadius
                         centerImage:(NSString *)centerImageName
                    centerBackground:(NSString *)centerBackgroundName
                           subImages:(void(^)(Button *))imageBlock
                  subImageBackground:(NSString *)subImageBackgroundName
                         inLocationX:(CGFloat)xAxis
                           locationY:(CGFloat)yAxis
                        toParentView:(UIView *)parentView;

@property (nonatomic, weak) id<ButtonDelegate> delegate;
@property (nonatomic, getter = isExpanded) BOOL expanded;

@property (nonatomic) CGFloat totalRaiuds;
@property (nonatomic) CGFloat centerRadius;
@property (nonatomic) CGFloat subRadius;
@property (nonatomic) NSInteger buttonCount;
@property (nonatomic) CGFloat centerLocationAxisX;
@property (nonatomic) CGFloat centerLocationAxisY;
@property (nonatomic, strong) UIView *parentView;

@property (strong, nonatomic) UIButton *centerButton;
@property (strong, nonatomic) but *subButton;
@property (strong, nonatomic) NSMutableArray *buttons;

- (void)subButtonImage:(NSString *)imageName withTag:(NSInteger)tag;
@end
