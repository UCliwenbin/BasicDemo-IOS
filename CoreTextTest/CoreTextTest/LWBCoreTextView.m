//
//  LWBCoreTextView.m
//  CoreTextTest
//
//  Created by mac on 2018/7/11.
//  Copyright © 2018年 lwb. All rights reserved.
//

#import "LWBCoreTextView.h"
#import <CoreText/CoreText.h>
#import "CoreTextImageData.h"

@interface LWBCoreTextView ()

@property (nonatomic, assign) CTFramesetterRef framesetter;
@property (nonatomic, assign) CTFrameRef ctFrame;

@end

@implementation LWBCoreTextView

static inline double radians(double degree) {
    return degree * M_PI / 180;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self createCTFrame];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
//     Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);

      if (self.data) {
          CTFrameDraw(self.data.ctFrame, context);
      }
    for (CoreTextImageData *imageData in self.data.imageArray) {
        UIImage *image = [UIImage imageNamed:imageData.name];
        CGContextDrawImage(context, imageData.imagePosition, image.CGImage);
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];
    for (CoreTextImageData * imageData in self.data.imageArray) {
           // 翻转坐标系，因为 imageData 中的坐标是 CoreText 的坐标系
           CGRect imageRect = imageData.imagePosition;
           CGPoint imagePosition = imageRect.origin;
           imagePosition.y = self.bounds.size.height - imageRect.origin.y
                             - imageRect.size.height;
           CGRect rect = CGRectMake(imagePosition.x, imagePosition.y, imageRect.size.width, imageRect.size.height);
           // 检测点击位置 Point 是否在 rect 之内
           if (CGRectContainsPoint(rect, point)) {
               // 在这里处理点击后的逻辑
               NSLog(@"bingo");
               break;
           }
       }
}
//
//- (void)createCTFrame {
//
//    /*
//     创建 CTFrame 需要两个参数：CTFramesetter 和 CGMutablePath。
//
//     先创建 CTFramesetter，利用 CTFramesetter 计算出绘制区域高度后再创建 CGMutablePath。
//
//     创建 CTFramesetter 需要先创建 NSAttributedString。
//     */
//
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
//
//    NSMutableAttributedString *aStr1 = [[NSMutableAttributedString alloc] initWithString:@"创建 CTFrame 需要两个参数：CTFramesetter 和 CGMutablePath。\n" attributes:@{(id)kCTForegroundColorAttributeName : [UIColor redColor]}];
//
//    NSMutableAttributedString *aStr2 = [[NSMutableAttributedString alloc] initWithString:@"先创建 CTFramesetter，利用 CTFramesetter 计算出绘制区域高度后再创建 CGMutablePath。\n" attributes:@{(id)kCTForegroundColorAttributeName : [UIColor blueColor]}];
//
//    NSMutableAttributedString *aStr3 = [[NSMutableAttributedString alloc] initWithString:@"创建 CTFramesetter 需要先创建NSAttributedString." attributes:@{(id)kCTForegroundColorAttributeName : [UIColor blackColor]}];
//
//    [attributedString appendAttributedString:aStr1];
//    [attributedString appendAttributedString:aStr2];
//    [attributedString appendAttributedString:aStr3];
//
//    // 用创建好的 attString 创建 framesetter
//    self.framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributedString);
//
//    // 获得要绘制的区域的高度
//    CGSize restrictSize = CGSizeMake(self.bounds.size.width, CGFLOAT_MAX);
//    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(self.framesetter, CFRangeMake(0,0), nil, restrictSize, nil);
//    self.textHeight = coreTextSize.height;
//
//    // 创建 CGMutablePath
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddEllipseInRect(path, NULL, CGRectMake(0, 0, self.bounds.size.width, self.textHeight));
//
//    // 创建 ctFrame
//    self.ctFrame = CTFramesetterCreateFrame(self.framesetter, CFRangeMake(0, 0), path, NULL);
//
//    CFRelease(path);
//}



@end
