//
//  NSMutableDictionary+Extension.m
//  Study
//
//  Created by 孟宪亮 on 2021/8/29.
//

#import "NSMutableDictionary+Extension.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (Extension)

+ (void)load {
    Class arrayClass = NSClassFromString(@"__NSDictionaryM");
    Method method1 = class_getInstanceMethod(arrayClass, @selector(setObject:forKey:));
    Method method2 = class_getInstanceMethod(arrayClass, @selector(xl_setObject:forKey:));
    method_exchangeImplementations(method1, method2);
}

- (void)xl_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (anObject && aKey) {
        [self xl_setObject:anObject forKey:aKey];
    }
    NSLog(@"%s", __func__);
}

@end
