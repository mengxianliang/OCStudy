//
//  Person.m
//  Study
//
//  Created by mxl on 2021/8/11.
//

#import "Person.h"

@implementation Person

//- (void)setAge:(int)age {
//    NSLog(@"setAge:%d",age);
//}

//- (void)_setAge:(int)age {
//    NSLog(@"_setAge:%d",age);
//}

+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}

- (void)willChangeValueForKey:(NSString *)key {
    
}

- (void)didChangeValueForKey:(NSString *)key {
    
}


@end
