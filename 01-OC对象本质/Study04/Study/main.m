//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

@interface Student : NSObject
{
    int _no;
    int _age;
    int _height;
}

@end

@implementation Student
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Student *stu = [[Student alloc] init];
        
        NSLog(@"stu = %zd,%zd",class_getInstanceSize([Student class]),malloc_size((__bridge const void*)stu));
        
    }
    return 0;
}
