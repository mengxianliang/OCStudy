//
//  Person.m
//  Study
//
//  Created by mxl on 2021/9/8.
//

#import "Person.h"

@implementation Person

// 设置属性的成员变量名称
// 自动生成成员变量的setter、getter实现
@synthesize age = _age;


- (void)dealloc {
    self.dog = nil;
    self.car = nil;
    
    [super dealloc];
}

@end
