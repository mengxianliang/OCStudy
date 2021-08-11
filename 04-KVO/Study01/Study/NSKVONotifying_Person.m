//
//  NSKVONotifying_Person.m
//  Study
//
//  Created by mxl on 2021/8/11.
//

#import "NSKVONotifying_Person.h"

@implementation NSKVONotifying_Person

- (void)setAge:(int)age {
    _NSSetIntValueAndNotify();
}

// 伪代码
void _NSSetIntValueAndNotify() {
    [self willChangeValueForKey:@"age"];
    [super setAge:age];
    [self didChangeValueForKey:@"age"];
}

- (void)didChangeValueForKey:(NSString *)key {
    // 通知监听器，某某属性值发生了改变
    [oberser observeValueForKeyPath:key ofObject:self change:nil context:nil];
}

@end
