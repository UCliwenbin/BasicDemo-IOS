//
//  HyperLinkButton.h
//  HyperLinks
//
//  Created by mac on 2020/1/6.
//  Copyright © 2020 lwb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HyperLinkButton : UIButton

@property (nonatomic, strong) UIColor *linkColor;
@property (nonatomic, assign) BOOL isHighlight;

+ (instancetype)hyperlinkButton;

@end

NS_ASSUME_NONNULL_END
