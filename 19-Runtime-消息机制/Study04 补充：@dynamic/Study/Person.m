//
//  Person.m
//  Study
//
//  Created by 孟宪亮 on 2021/8/21.
//

#import "Person.h"
#import <objc/runtime.h>
#import "Cat.h"

@implementation Person

// 通知编译器，不要给age自动添加setter和getter方法，不要添加成员变量
@dynamic age;


@end
