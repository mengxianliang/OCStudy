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


@interface Person : NSObject
{
    int _no;
}

@end

@implementation Person
@end


@interface Student : Person
{
    int _age;
}

@end

@implementation Student
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        Student *stu = [[Student alloc] init];
        
        NSLog(@"person = %zd",class_getInstanceSize([Person class]));
        NSLog(@"person = %zd",malloc_size((__bridge const void*)person));
        
        NSLog(@"stu = %zd",class_getInstanceSize([Student class]));
        NSLog(@"stu = %zd",malloc_size((__bridge const void*)stu));
        
    }
    return 0;
}
