//
//  CoreTextImageData.h
//  CoreTextTest
//
//  Created by mac on 2020/1/9.
//  Copyright © 2020 lwb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CoreTextImageData : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger position;
@property (nonatomic, assign) CGRect imagePosition;

@end

NS_ASSUME_NONNULL_END
