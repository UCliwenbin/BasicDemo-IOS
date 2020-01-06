//
//  but.m
//  弹出式按钮
//
//  Created by Love on 13-10-18.
//  Copyright (c) 2013年 Love. All rights reserved.
//

#import "but.h"

@implementation but

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.highlighted = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([_delegate respondsToSelector:@selector(subButtonPress:)]) {
        [_delegate subButtonPress:self];
    }
    self.highlighted= NO;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    self.highlighted = NO;
}
@end
