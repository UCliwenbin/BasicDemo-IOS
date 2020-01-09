//
//  HyperLinkButton.m
//  HyperLinks
//
//  Created by mac on 2020/1/6.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "HyperLinkButton.h"

@implementation HyperLinkButton


+ (instancetype)hyperlinkButton {
    HyperLinkButton *button = [[HyperLinkButton alloc] init];
    return button;
}


- (void)drawRect:(CGRect)rect {
    CGRect textRect = self.titleLabel.frame;
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGFloat descender = self.titleLabel.font.descender;
    if ([self.linkColor isKindOfClass:[UIColor class]]) {
        CGContextSetStrokeColorWithColor(contextRef, self.linkColor.CGColor);
    }
    CGContextMoveToPoint(contextRef, textRect.origin.x, textRect.origin.y+textRect.size.height+descender+5);
    CGContextAddLineToPoint(contextRef, textRect.origin.x+textRect.size.width, textRect.origin.y+textRect.size.height+descender+5);
    CGContextClosePath(contextRef);
    CGContextDrawPath(contextRef, kCGPathStroke);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.titleLabel setTextColor:[UIColor redColor]];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.titleLabel setTextColor:self.linkColor];
}


@end
