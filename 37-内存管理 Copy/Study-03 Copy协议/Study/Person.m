//
//  Person.m
//  Study
//
//  Created by mxl on 2021/9/9.
//

#import "Person.h"

@implementation Person


- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    Person *p = [[Person allocWithZone:zone] init];
    p.name = self.name;
    p.age = self.age;
    p.weight = self.weight;
    return p;
}

@end
