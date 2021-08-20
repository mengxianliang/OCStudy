//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>

typedef void(^XLBlock)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        __block int age = 10;
        XLBlock block = ^{
            age = 20;
            NSLog(@"age = is %d",age);
        };
        block();
    }
    return 0;
}
