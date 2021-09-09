//
//  Person.m
//  Study
//
//  Created by mxl on 2021/9/9.
//

#import "Person.h"

@implementation Person

- (void)dealloc {
    
    NSLog(@"%s", __func__);
    [super dealloc];
}

@end

class AutoreleasePoolPage
{
    magic_t const magic;
    id *next;
    pthread_t const thread;
    AutoreleasePoolPage * const parent;
    AutoreleasePoolPage *child;
    uint32_t const deptch;
    uint32_t hiwat;
    
}
