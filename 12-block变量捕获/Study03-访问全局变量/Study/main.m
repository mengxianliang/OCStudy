//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>

// 定义了两个全局变量
int age_ = 10;
static int height_ = 10;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        void (^block)(void) = ^{
            NSLog(@"age = %d, height = %d",age_,height_);
        };
        
        age_ = 20;
        height_ = 20;
        
        block();
    }
    return 0;
}
