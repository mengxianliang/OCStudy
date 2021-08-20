//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *person = [[Person alloc] init];
        void (^block)(void) = ^{
            NSLog(@"person = %p",person);
        };
        block();
    }
    return 0;
}
