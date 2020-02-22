//
//  Slider.m
//  TextSlider
//
//  Created by mac on 2020/2/22.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "Slider.h"

@implementation Slider

- (ShowTextView *)popover {
    if (!_popover) {
        [self addTarget:self action:@selector(updatePopoverFrame) forControlEvents:(UIControlEventValueChanged)];
        _popover = [[ShowTextView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y-35, 40, 32)];
        [self updatePopoverFrame];
        _popover.alpha = 0;
        [self.superview addSubview:_popover];
    }
    return _popover;
}

- (void)updatePopoverFrame {
    CGFloat minimum = self.minimumValue;
    CGFloat maximum = self.maximumValue;
    CGFloat value = self.value;
    //小于0的话归到0
    if (minimum < 0) {
        value = self.value - minimum;
        maximum = maximum - minimum;
        minimum = 0;
    }
    CGFloat x = self.frame.origin.x;
    CGFloat maxMin = (maximum + minimum) / 2;
    x += (((value - minimum) / (maximum - minimum)) * self.frame.size.width) - (self.popover.frame.size.width / 2.0);
    if (value > maxMin) {
        value = (value - maxMin) + (minimum * 1.0);
        value = value / maxMin;
        value = value * 11.0;
        x = x - value;
    } else {
        value = (maxMin - value) + (minimum * 1.0);
        value = value / maxMin;
        value = value * 11.0;
        x = x + value;
    }
    CGRect popoverRect = self.popover.frame;
    popoverRect.origin.x = x;
    popoverRect.origin.y = self.frame.origin.y - self.popover.frame.size.height - 1;
    self.popover.frame = popoverRect;
    self.popover.textLabel.text = [NSString stringWithFormat:@"%.2f",self.value];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self updatePopoverFrame];
    [self showPopoverAnimated:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self hidePopoverAnimated:YES];
    [super touchesEnded:touches withEvent:event];
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self hidePopoverAnimated:YES];
    [super touchesCancelled:touches withEvent:event];
}

- (void)showPopoverAnimated:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.25 animations:^{
            self.popover.alpha = 1.0;
        }];
    } else {
        self.popover.alpha = 1.f;
    }
}

- (void)hidePopoverAnimated:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.25 animations:^{
            self.popover.alpha = 0.f;
        }];
        
    } else {
        self.popover.alpha = 0.f;
    }
}
@end
