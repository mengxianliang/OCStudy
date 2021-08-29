//
//  NSMutableArray+Extension.m
//  Study
//
//  Created by 孟宪亮 on 2021/8/29.
//

#import "NSMutableArray+Extension.h"
#import <objc/runtime.h>

@implementation NSMutableArray (Extension)

+ (void)load {
    
    Class arrayClass = NSClassFromString(@"__NSArrayM");
    Method method1 = class_getInstanceMethod(arrayClass, @selector(insertObject:atIndex:));
    Method method2 = class_getInstanceMethod(arrayClass, @selector(xl_insertObject:atIndex:));
    method_exchangeImplementations(method1, method2);
}

- (void)xl_insertObject:(id)anObject atIndex:(NSUInteger)index {
    
    if (anObject) {
        [self xl_insertObject:anObject atIndex:index];
    }
}

@end
