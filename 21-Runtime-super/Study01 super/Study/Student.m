//
//  Student.m
//  Study
//
//  Created by mxl on 2021/8/26.
//

#import "Student.h"
#import <objc/runtime.h>

@implementation Student

- (void)run {
    [super run];
}

//- (instancetype)init {
//    if (self = [super init]) {
//
//
//        NSLog(@"第一组----------");
//        NSLog(@"[self class] %@", [self class]);
//        NSLog(@"[self superclass] %@", [self superclass]);
//
//
//        NSLog(@"第二组----------");
//        NSLog(@"[super class] %@", [super class]);
//        NSLog(@"[super superclass] %@", [super superclass]);
//    }
//    return self;
//}

@end

@implementation NSObject

- (Class)class {
    return object_getClass(self);
}

- (Class)superclass {
    return object_getClass(object_getClass(self));
}

@end
