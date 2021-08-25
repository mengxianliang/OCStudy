//
//  Person.m
//  Study
//
//  Created by 孟宪亮 on 2021/8/21.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

//- (void)test {
//    NSLog(@"%s",__func__);
//}


//- (void)other {
//    NSLog(@"%s",__func__);
//}
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//
//    NSLog(@"%s",__func__);
//
//    // 动态添加test方法实现
//    if (sel == @selector(test)) {
//        // 获取其它方法
//        Method method = class_getInstanceMethod(self, @selector(other));
//        //
//        class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));
//        return YES;
//    }
//
//    return  [super resolveInstanceMethod:sel];;
//}


void c_other(id self, SEL _cmd)
{
    NSLog(@"c_other-%@-%@",self,NSStringFromSelector(_cmd));
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    NSLog(@"%s",__func__);
    
    // 动态添加test方法实现
    if (sel == @selector(test)) {
        class_addMethod(self, sel, (IMP)c_other, "v16@0:8");
        return YES;
    }
    
    return  [super resolveInstanceMethod:sel];;
}

@end
