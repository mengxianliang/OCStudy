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
        
        Dog *dog = [[Dog alloc] init];
        
        Person *person = [[Person alloc] init];
        [person setDog:dog];
        [[person dog] run];
        
        [person release];
        [dog release];
        
    }
    return 0;
}

void test1()
{
    // 创建出来引用计数是1
    Person *person = [[Person alloc] init];
    
    NSLog(@"%zd",person.retainCount);

    // release后引用计数变为0
    [person release];

    NSLog(@"end");
}
