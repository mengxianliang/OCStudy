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
        XLBlock block;
        {
            Person *person = [[Person alloc] init];
            __weak typeof(person)weakPerson = person;
            block = ^{
                NSLog(@"weakPerson = %@", weakPerson);
            };
            
            block();
            NSLog(@"block = %@", block);
        }
        NSLog(@"mark");
    }
    return 0;
}

void test(void) {
//    XLBlock block;
//    
//    Person *person = [[Person alloc] init];
//    
////        block = ^{
////            NSLog(@"person = %@", person);
////        };
//    
//    block = [^{
//        NSLog(@"person = %@", person);
//    } copy];
//
//    block();
//    NSLog(@"block = %@", block);
//    
//    [person release];
//    NSLog(@"mark");
//    
//    [block release];
}
