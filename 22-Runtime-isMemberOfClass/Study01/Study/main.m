//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *person = [[Person alloc] init];
        
        
        NSLog(@"%d",[person isMemberOfClass:[Person class]]);
        NSLog(@"%d",[person isMemberOfClass:[NSObject class]]);
        
        NSLog(@"%d",[person isKindOfClass:[NSObject class]]);
        NSLog(@"%d",[person isKindOfClass:[Person class]]);
        
        NSLog(@"%d",[Person isKindOfClass:[Person class]]);
        NSLog(@"%d",[Person isMemberOfClass:[Person class]]);
        
        NSLog(@"%d",[Person isKindOfClass:object_getClass([Person class])]);
        NSLog(@"%d",[Person isMemberOfClass:object_getClass([Person class])]);
        
        NSLog(@"%d",[Person isMemberOfClass:[Person class]]);
        NSLog(@"%d",[Person isKindOfClass:[Person class]]);
        
        NSLog(@"%d",[NSObject isMemberOfClass:[NSObject class]]);
        NSLog(@"%d",[NSObject isKindOfClass:[NSObject class]]);
        
    }
    return 0;
}
