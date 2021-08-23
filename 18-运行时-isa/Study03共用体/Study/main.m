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
        Person *person = [[Person alloc] init];
        person.tall = YES;
        person.rich = YES;
        person.handsome = YES;
        NSLog(@"person.tall = %d, person.rich = %d, person.handsome = %d",person.tall, person.rich, person.handsome);
    }
    
    return 0;
}
