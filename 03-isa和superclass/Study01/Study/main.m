//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>






@interface Person : NSObject

- (void)personInstanceMethod;

+ (void)classMethod;

@end

@implementation Person

- (void)instanceMethod {
    
}

+ (void)classMethod {
    
}

@end

@interface Student : Person

- (void)instanceMethod;

+ (void)classMethod;

@end

@implementation Student

- (void)instanceMethod {
    
}

+ (void)classMethod {
    
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        /// 实例对象
//        NSObject *obj1 = [[NSObject alloc] init];
//        NSObject *obj2 = [[NSObject alloc] init];
//
//        /// 类对象
//        Class objectClass1 = obj1.class;
//        Class objectClass2 = obj2.class;
//        Class objectClass3 = object_getClass(obj1);
//        Class objectClass4 = object_getClass(obj2);
//        Class objectClass5 = [NSObject class];
//
//        NSLog(@"class - %p,%p,%p,%p,%p",objectClass1,objectClass2,objectClass3,objectClass4,objectClass5);
//
//        /// 元类对象
//        Class objectMetaClass = object_getClass([NSObject class]);
//        NSLog(@"meta-class = %p",objectMetaClass);
//
//        BOOL isMetaClass = class_isMetaClass(objectMetaClass);
        
        Person *person = [[Person alloc] init];
        [person instanceMethod]; // 实例对象方法
        [Person classMethod]; // 类方法
        
        Class class = person.superclass;
        
        
        
    }
    return 0;
}
