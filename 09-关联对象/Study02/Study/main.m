//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+Test1.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *person1 = [[Person alloc] init];
        person1.age = 1;
        person1.name = @"Jack";
        
        Person *person2 = [[Person alloc] init];
        person2.age = 30;
        person2.name = @"Tom";
        
        NSLog(@"person1.age = %d, person1.name = %@",person1.age, person1.name);
        NSLog(@"person2.age = %d, person2.name = %@",person2.age, person2.name);
        
    }
    return 0;
}
