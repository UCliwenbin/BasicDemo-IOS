//
//  CTFrameParserConfig.m
//  CoreTextTest
//
//  Created by mac on 2020/1/9.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "CTFrameParserConfig.h"
#import "macro_ui.h"

@implementation CTFrameParserConfig

- (id)init {
    self = [super init];
        if (self) {
        _width = 200.0f;
        _fontSize = 16.0f;
        _lineSpace = 8.0f;
        _textColor = RGB(108, 108, 108);
        }
    return self;
}

@end
