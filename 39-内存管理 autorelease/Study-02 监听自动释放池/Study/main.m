//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>
#import "Person.h"


extern void _objc_autoreleasePoolPrint(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        for (int i = 0; i < 1000; i++) {
            NSObject *obj = [[[NSObject alloc] init] autorelease];
        }
        
        _objc_autoreleasePoolPrint();
    }
    return 0;
}

