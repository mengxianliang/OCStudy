//
//  UIControl+Extension.m
//  Study
//
//  Created by 孟宪亮 on 2021/8/29.
//

#import "UIControl+Extension.h"
#import <objc/runtime.h>

@implementation UIControl (Extension)

+ (void)load {
    Method method1 = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method method2 = class_getInstanceMethod(self, @selector(xl_sendAction:to:forEvent:));
    method_exchangeImplementations(method1, method2);
}

- (void)xl_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    // 调用被交换的方法
    [self xl_sendAction:action to:target forEvent:event];
    
    NSLog(@"%s", __func__);
}

@end
