//
//  CTFrameParser.h
//  CoreTextTest
//
//  Created by mac on 2020/1/9.
//  Copyright © 2020 lwb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreTextData.h"
#import "CTFrameParserConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface CTFrameParser : NSObject

+ (CoreTextData *)parseContent:(NSMutableAttributedString *)content config:(CTFrameParserConfig*)config;

+ (NSMutableDictionary *)attributesWithConfig:(CTFrameParserConfig *)config;

+ (CoreTextData *)parseTemplateFile:(NSString *)path config:(CTFrameParserConfig*)config;

@end

NS_ASSUME_NONNULL_END
