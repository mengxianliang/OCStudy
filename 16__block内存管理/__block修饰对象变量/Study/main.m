//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>
#import "Person.h"

typedef void(^XLBlock)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
//        __block int age = 10;
//
//        __block NSObject *obj = [[NSObject alloc] init];
//
//        NSLog(@"age = is %d,%p",age,&age);
//        NSLog(@"obj = is %p",&obj);
//
//
//        XLBlock block = ^{
//            age = 20;
//            NSLog(@"\n");
//            NSLog(@"age = is %d,%p",age,&age);
//            NSLog(@"obj = is %p",&obj);
//        };
//        block();
//
//        NSLog(@"\n");
//        NSLog(@"age = is %d,%p",age,&age);
//        NSLog(@"obj = is %p",&obj);
        
        
//        __block int age = 10;
        __block __weak Person *person = [[Person alloc] init];
        NSLog(@"person = is %p",&person);
        XLBlock block = ^{
//            NSLog(@"age = is %d,%p",age,&age);
            NSLog(@"person = is %p",&person);
        };
        block();
        NSLog(@"person = is %p",&person);
    }
    
    return 0;
}
