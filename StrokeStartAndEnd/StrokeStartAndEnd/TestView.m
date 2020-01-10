//
//  TestView.m
//  StrokeStartAndEnd
//
//  Created by mac on 2020/1/10.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "TestView.h"
#import <CoreText/CoreText.h>

@implementation TestView


- (void)drawRect:(CGRect)rect {
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2,self.bounds.size.height/2) radius:MIN(self.bounds.size.width, self.bounds.size.height)/2 startAngle:M_PI*3/2 endAngle:M_PI*7/2 clockwise:YES];
//
//    // 对勾
//    CGFloat W = self.frame.size.width *0.9;
//    CGFloat H = self.frame.size.height*0.9;
//    UIBezierPath *subPath  = [UIBezierPath bezierPath];
//    [subPath moveToPoint:CGPointMake(W/4,H/2)];
//    [subPath addLineToPoint:CGPointMake(W/2,(H/2)+ H/4)];
//    [subPath addLineToPoint:CGPointMake(W-(W/8),H/4)];
    NSString *str = @"abcdeft";
    UIBezierPath *bezierPath = [self getStringLayer:str];
    // 添加到路径上 由于CAShapeLayer只能添加一条路径  幸好贝赛尔曲线有个appendPath: 方法 可以让我们画多条路径
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor= [UIColor blueColor].CGColor;
    shapeLayer.lineWidth = 1;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    [self.layer addSublayer:shapeLayer];
    
    CABasicAnimation *animEnd = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animEnd.duration = 5;
    animEnd.fromValue = @(0);
    animEnd.toValue = @(1);
    [shapeLayer addAnimation:animEnd forKey:nil];
    
//    CABasicAnimation *animStart = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
//    animStart.beginTime = CACurrentMediaTime() + 2;
//    animStart.duration = 5;
//    animStart.fromValue = @(0);
//    animStart.toValue = @(1);
//    [shapeLayer addAnimation:animStart forKey:nil];
}

- (UIBezierPath *)getStringLayer:(NSString *)str{
    //创建可变path
    CGMutablePathRef letters = CGPathCreateMutable();
    
    //    HelveticaNeue-UltraLight
    //设置字体
    CTFontRef font = CTFontCreateWithName(CFSTR("Helvetica-Bold"), 32.0f, NULL);
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                           (__bridge id)font, kCTFontAttributeName,
                           nil];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:str
                                                                     attributes:attrs];
    //根据字符串创建 line
    CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)attrString);
    
    //获取每一个字符作为数组
    CFArrayRef runArray = CTLineGetGlyphRuns(line);
    
    // 遍历字符数组
    for (CFIndex runIndex = 0; runIndex < CFArrayGetCount(runArray); runIndex++)
    {
        // Get FONT for this run
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runArray, runIndex);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        
        // for each GLYPH in run
        for (CFIndex runGlyphIndex = 0; runGlyphIndex < CTRunGetGlyphCount(run); runGlyphIndex++)
        {
            // get Glyph & Glyph-data
            CFRange thisGlyphRange = CFRangeMake(runGlyphIndex, 1);
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, thisGlyphRange, &glyph);
            CTRunGetPositions(run, thisGlyphRange, &position);
            
            // Get PATH of outline
            {
                CGPathRef letter = CTFontCreatePathForGlyph(runFont, glyph, NULL);
                CGAffineTransform t = CGAffineTransformMakeTranslation(position.x, position.y);
                CGPathAddPath(letters, &t, letter);
                CGPathRelease(letter);
            }
        }
    }
    CFRelease(line);
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path appendPath:[UIBezierPath bezierPathWithCGPath:letters]];
    CGPathRelease(letters);
    CFRelease(font);
    return path;
}

@end
