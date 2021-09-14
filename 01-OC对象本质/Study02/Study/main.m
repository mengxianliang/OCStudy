//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

struct NSObject_IMPL {
    Class isa;
};

struct Student_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _no;
    int _age;
};

@interface Student : NSObject
{
    @public
    int _no;
    int _age;
}

@end

@implementation Student



@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *stu = [[Student alloc] init];
        stu->_age = 5;
        stu->_no = 6;
        
        // 获得NSObject实例对象的成员变量所占用的大小 -> 8
        NSLog(@"stu = %zd",class_getInstanceSize([Student class]));

        // 获得obj指针所指向内存的大小 -> 16
        NSLog(@"stu = %zd",malloc_size((__bridge const void*)stu));
        
    }
    return 0;
}
