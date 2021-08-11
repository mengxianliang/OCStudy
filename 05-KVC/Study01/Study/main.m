//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        person.cat = [[Cat alloc] init];
        
        [person setValue:@10 forKey:@"age"];
        [person setValue:@20 forKeyPath:@"cat.weight"];
        
        int age = [[person valueForKey:@"age"] intValue];
        int weight = [[person valueForKeyPath:@"cat.weight"] intValue];
        
        NSLog(@"%@,%@", ,[person valueForKeyPath:@"cat.weight"]);
    }
    return 0;
}
