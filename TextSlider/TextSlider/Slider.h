//
//  Slider.h
//  TextSlider
//
//  Created by mac on 2020/2/22.
//  Copyright © 2020 lwb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowTextView.h"

NS_ASSUME_NONNULL_BEGIN

@interface Slider : UISlider

@property (nonatomic, strong) ShowTextView *popover;
- (void)showPopoverAnimated:(BOOL)animated;
- (void)hidePopoverAnimated:(BOOL)animated;



@end

NS_ASSUME_NONNULL_END
