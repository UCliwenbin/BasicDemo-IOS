//
//  ProgressLayer.m
//  ProgressButton
//
//  Created by mac on 2020/1/9.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "ProgressLayer.h"

@implementation ProgressLayer

- (instancetype)initWithLayer:(id)layer {
    self = [super initWithLayer:layer];
    if (self) {
        if ([layer isKindOfClass:[ProgressLayer class]]) {
            ProgressLayer *otherLayer = layer;
            self.progress = otherLayer.progress;
            self.startAngle = otherLayer.startAngle;
            self.tintColor = otherLayer.tintColor;
            self.trackColor = otherLayer.trackColor;
        }
    }
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"progress"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)ctx {
    CGFloat radius = MIN(self.bounds.size.width, self.bounds.size.height)/2.0;
    CGPoint center = {self.bounds.size.width/2,self.bounds.size.height/2};
    CGRect circleRect = {center.x-radius,center.y-radius,radius*2,radius*2};
    CGContextAddEllipseInRect(ctx, circleRect);
    CGContextSetFillColorWithColor(ctx, self.trackColor.CGColor);
    CGContextFillPath(ctx);
    CGContextAddArc(ctx, center.x, center.y, radius, self.startAngle, self.startAngle+self.progress*2*M_PI, 0);
    CGContextAddLineToPoint(ctx, center.x, center.y);
    CGContextClosePath(ctx);
    CGContextSetFillColorWithColor(ctx, self.tintColor.CGColor);
    CGContextFillPath(ctx);
    
}

@end
