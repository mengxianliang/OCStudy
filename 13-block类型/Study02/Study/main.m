//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int a = 1;
void test2() {
    int b = 2;
    NSObject *obj = [[NSObject alloc] init];
    NSLog(@"a %p",&a);
    NSLog(@"b %p",&b);
    NSLog(@"obj %p",obj);
    NSLog(@"NSObject class %p",[NSObject class]);
    NSLog(@"NSObject class %p",[NSArray class]);
    NSLog(@"Person class %p",[Person class]);
    NSLog(@"Dog class %p",[Dog class]);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        void (^block1)(void) = ^{
//
//        };
//
//        int age = 10;
//        void (^block2)(void) = ^{
//            NSLog(@"age = %d",age);
//        };
//
//        NSLog(@"block1.class = %@",[block1 class]);
//        NSLog(@"block2.class = %@",[block2 class]);
//        NSLog(@"block3.class = %@",[^{
//            NSLog(@"age = %d",age);
//        } class]);
        
        test2();
    }
    return 0;
}

void test() {
    // Global:没有访问auto变量
    void (^block1)(void) = ^ {
        
    };
    
    // Static:访问了auto变量
    int age = 10;
    void (^block2)(void) = ^{
        NSLog(@"age = %d",age);
    };
    
    // Malloc:Static类型block调用了copy
    void (^block3)(void) = [^{
        NSLog(@"age = %d",age);
    } copy];
}


