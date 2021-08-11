//
//  Person.m
//  Study
//
//  Created by mxl on 2021/8/11.
//

#import "Person.h"

@implementation Person

- (void)setAge:(int)age {
    _age = age;
    NSLog(@"setAge");
}

- (void)willChangeValueForKey:(NSString *)key {
    [super willChangeValueForKey:key];
    
    NSLog(@"willChangeValueForKey");
}

- (void)didChangeValueForKey:(NSString *)key {
    NSLog(@"didChangeValueForKey - Begin");
    
    [super didChangeValueForKey:key];
    
    NSLog(@"didChangeValueForKey - End");
}

@end
