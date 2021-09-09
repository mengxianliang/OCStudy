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
        Person *p = [[Person alloc] init];
        p.name = @"jack";
        p.age = 10;
        p.weight = 20;
        
        Person *p2 = [p copy];
        
        NSLog(@"%@ %d %d",p.name, p.age, p.weight);
        
        NSLog(@"%@ %d %d",p2.name, p2.age, p2.weight);
        
        [p release];
    }
    return 0;
}
