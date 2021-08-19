//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        void (^block1)(void) = ^{
            
        };
        
        int age = 10;
        void (^block2)(void) = ^{
            NSLog(@"age = %d",age);
        };
        
        NSLog(@"block1.class = %@",[block1 class]);
        NSLog(@"block2.class = %@",[block2 class]);
        NSLog(@"block3.class = %@",[^{
            NSLog(@"age = %d",age);
        } class]);
    }
    return 0;
}
