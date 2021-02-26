//
//  Person.h
//  TextSlider
//
//  Created by mac on 2020/2/23.
//  Copyright © 2020 lwb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test.h"

@protocol AADelegate <NSObject>



@end

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, strong) Test *test;

- (void)eat:(NSString *)food;

- (void)happen;

@end

NS_ASSUME_NONNULL_END
