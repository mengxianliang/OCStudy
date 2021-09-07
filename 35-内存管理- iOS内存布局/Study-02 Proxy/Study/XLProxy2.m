//
//  XLProxy2.m
//  Study
//
//  Created by mxl on 2021/9/7.
//

#import "XLProxy2.h"

@implementation XLProxy2

+ (instancetype)proxyWithTarget:(id)target {
    // NSProxy没有init方法
    XLProxy2 *proxy = [XLProxy2 alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}


- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

@end
