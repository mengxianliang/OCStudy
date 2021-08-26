//
//  Person.m
//  Study
//
//  Created by 孟宪亮 on 2021/8/21.
//

#import "Person.h"
#import <objc/runtime.h>
#import "Cat.h"

@implementation Person

//// 转发接收者，指定一个新的消息接收者
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(test)) {
//        return [[Cat alloc] init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

// 返回方法签名：返回值类型、参数类型
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(test)) {
//        return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
        return [[[Cat alloc] init] methodSignatureForSelector:@selector(test)];
    }
    return [super methodSignatureForSelector:aSelector];
}

// NSInvocation封装了一个方法调用，包括方法调用者、方法名、方法参数
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [anInvocation invokeWithTarget:[[Cat alloc] init]];
}

@end
