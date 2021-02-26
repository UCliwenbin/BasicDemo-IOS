
//
//  Person.m
//  TextSlider
//
//  Created by mac on 2020/2/23.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>


@implementation Person

//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    class_addMethod(self,sel,eat,"");
//    return [super resolveInstanceMethod:sel];
//    
//}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    Test *test = [[Test alloc] init];
    anInvocation.selector = @selector(eatTest:);
    [anInvocation invokeWithTarget:test];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    return signature;
}



+ (BOOL)resolveClassMethod:(SEL)sel {
    class_addMethod([self class], sel, drink, "");
    return [super resolveClassMethod:sel];
}

- (void)test {
    [self methodForSelector:@selector(eat:)];
}


void eat(id self,SEL _cmd,NSString * food) {
    NSLog(@"我来了");

}

void drink(id self, SEL _cmd) {
    
}

- (void)happen {
    NSLog(@"happen");
}

@end
