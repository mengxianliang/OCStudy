//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "MJClassInfo.h"
//#import "XLClassInfo.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"@encode(int) = %s", @encode(int));
        NSLog(@"@encode(void) = %s", @encode(void));
        NSLog(@"@encode(id) = %s", @encode(id));
        NSLog(@"@encode(SEL) = %s", @encode(SEL));
        
        Person *person = [[Person alloc] init];
//        [person testAge:10 height:20];
        
        
        
        mj_objc_class *cls = (__bridge mj_objc_class *)([Person class]);
        class_rw_t *data = cls->data();
        
        NSLog(@"111");
    }
    return 0;
}
