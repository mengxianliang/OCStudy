//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        auto int age = 10;
        
        static int height = 10;
        
        void (^block)(void) = ^{
            NSLog(@"age = %d, height = %d",age,height);
        };
        
        age = 20;
        height = 20;
        
        block();
    }
    return 0;
}
