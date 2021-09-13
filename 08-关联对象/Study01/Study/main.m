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
        
        Person *person = [[Person alloc] init];
//        person.weight = 10;
        
        NSLog(@"person.width = %d", person.weight);
    }
    return 0;
}
