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
        
        //__weak解决循环引用
//        Person *person = [[Person alloc] init];
//        __weak typeof(person) weakPerson = person;
//        person.block = ^{
//            NSLog(@"person = %p", weakPerson);
//        };
        
//        //__block解决循环引用
//        __block Person *person = [[Person alloc] init];
//        NSLog(@"1 person = %p", person);
//        person.block = ^{
//            NSLog(@"2 person = %p", person);
//            person = nil;
//        };
//        person.block();
//        NSLog(@"3 person = %p", person);
        
//        //MRC __unsafe_unretained解决循环引用
//        Person *person = [[Person alloc] init];
//        __unsafe_unretained typeof(person) weakPerson = person;
//        person.block = ^{
//            NSLog(@"person = %p", weakPerson);
//        };
        
        //MRC __block解决循环引用
        __block Person *person = [[Person alloc] init];
        person.block = ^{
            NSLog(@"person = %p", person);
        };
    }
    
    return 0;
}
