//
//  XLProxy1.m
//  Study
//
//  Created by mxl on 2021/9/7.
//  继承于NSObject

#import "XLProxy1.h"

@implementation XLProxy1

+ (instancetype)proxyWithTarget:(id)target {
    XLProxy1 *proxy = [[XLProxy1 alloc] init];
    proxy.target = target;
    return proxy;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.target;
}

@end
