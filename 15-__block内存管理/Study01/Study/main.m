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
        
        
        __block int age = 10;
//        __weak NSObject *obj = [[NSObject alloc] init];
        
        XLBlock block = ^{
            NSLog(@"age = is %d,%p",age,&age);
//            NSLog(@"obj = is %p",&obj);
        };
        block();
    }
    
    return 0;
}
