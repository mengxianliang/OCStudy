//
//  Person.m
//  Study
//
//  Created by mxl on 2021/8/19.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        self.name = name;
    }
    return self;
}

- (void)test {
    void (^block)(void) = ^{
        NSLog(@"self.name = %@",self.name);
    };
    block();
}


@end
