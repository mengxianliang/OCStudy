//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int age = 10;
        void (^block)(void) = ^{
            NSLog(@"this is a block!,age = %d",age);
        };
        block();
    }
    return 0;
}
