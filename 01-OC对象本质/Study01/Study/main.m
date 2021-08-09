//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj = [[NSObject alloc] init];
        
        // 获得NSObject实例对象的成员变量所占用的大小 -> 8
        NSLog(@"class_getInstanceSize = %zd",class_getInstanceSize([NSObject class]));
        
        // 获得obj指针所指向内存的大小 -> 16
        NSLog(@"malloc_size = %zd",malloc_size((__bridge const void*)obj));
        
        
        
        
    }
    return 0;
}
