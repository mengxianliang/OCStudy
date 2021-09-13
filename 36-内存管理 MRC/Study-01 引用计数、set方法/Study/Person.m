//
//  Person.m
//  Study
//
//  Created by mxl on 2021/9/8.
//

#import "Person.h"

@implementation Person

- (void)setDog:(Dog *)dog {
    if (_dog != dog) {
        [_dog release];
        _dog = [dog retain];
    }
}

- (Dog *)dog {
    return _dog;
}

- (void)dealloc {
    
    // 销毁成员变量
    [_dog release];
    _dog = nil;
    
    // 父类的dealloc放在后面执行
    [super dealloc];
    NSLog(@"%s",__func__);
}

@end
