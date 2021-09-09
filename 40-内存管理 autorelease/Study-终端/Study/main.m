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
        Person *person = [[[Person alloc] init] autorelease];
    }
    return 0;
}

/**
 
 struct __AtAutoreleasePool {
   __AtAutoreleasePool() { // 构造函数，在创建结构体的时候调用
       atautoreleasepoolobj = objc_autoreleasePoolPush();
   }
     
   ~__AtAutoreleasePool() { // 析构函数，在结构体销毁的时候调用
       objc_autoreleasePoolPop(atautoreleasepoolobj);
   }
     
   void * atautoreleasepoolobj;
 };

 __AtAutoreleasePool __autoreleasepool;
 Person *person = [[[Person alloc] init] autorelease];
 
 
 atautoreleasepoolobj = objc_autoreleasePoolPush();
 
 Person *person = [[[Person alloc] init] autorelease];
 
 objc_autoreleasePoolPop(atautoreleasepoolobj);
 
 
 
 */
