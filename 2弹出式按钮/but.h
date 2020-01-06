//
//  but.h
//  弹出式按钮
//
//  Created by Love on 13-10-18.
//  Copyright (c) 2013年 Love. All rights reserved.
//

#import <UIKit/UIKit.h>
@class but;
@protocol butDelegate <NSObject>
- (void)subButtonPress:(but*)button;
@end

@interface but : UIButton
@property (nonatomic, weak) id<butDelegate> delegate;
@end
