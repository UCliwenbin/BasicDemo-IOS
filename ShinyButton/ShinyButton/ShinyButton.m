//
//  ShinyButton.m
//  ShinyButton
//
//  Created by mac on 2020/1/9.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "ShinyButton.h"

@implementation ShinyButton

- (instancetype)initWithFrame:(CGRect)frame withBackgroundColor:(UIColor *)backgroundColor {
    self = [super initWithFrame:frame];
    if (self) {
        self.myColor = backgroundColor;
        [self makeButtonShiny:self withBackgroundColor:backgroundColor];
        [self addTarget:self action:@selector(wasPressed) forControlEvents:(UIControlEventTouchDown)];
        [self addTarget:self action:@selector(endedPressed) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return self;
}
    

- (void)wasPressed {
    UIColor *newColor;
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0, white = 0.0;
    if ([self.myColor respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self.myColor getRed:&red green:&green blue:&blue alpha:&alpha];
        [self.myColor getWhite:&white alpha:&alpha];
        newColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    }
    self.backgroundColor = newColor;
}

- (void)endedPressed {
    self.backgroundColor = self.myColor;
}

- (void)makeButtonShiny:(ShinyButton *)button withBackgroundColor:(UIColor *)backgroundColor {
    CALayer *layer = button.layer;
    layer.cornerRadius = 8.f;
    layer.masksToBounds = YES;
    layer.borderColor = [UIColor colorWithWhite:0.4f alpha:0.2f].CGColor;
    CAGradientLayer *shineLayer = [CAGradientLayer layer];
    shineLayer.frame = layer.bounds;
    shineLayer.colors = @[(id)[UIColor colorWithWhite:1 alpha:0.4f].CGColor,
                          (id)[UIColor colorWithWhite:0.1 alpha:0.2].CGColor,
                          (id)[UIColor colorWithWhite:0.75 alpha:0.2].CGColor,
                          (id)[UIColor colorWithWhite:0.4 alpha:0.2].CGColor,
                          (id)[UIColor colorWithWhite:1 alpha:0.4].CGColor];
    shineLayer.locations = @[@(0.f),@(.5f),@(.5f),@(.8f),@(1.f)];
    [layer addSublayer:shineLayer];
    [button setBackgroundColor:backgroundColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
