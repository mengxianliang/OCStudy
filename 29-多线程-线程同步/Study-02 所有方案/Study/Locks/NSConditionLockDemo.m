//
//  NSConditionLockDemo.m
//  Study
//
//  Created by mxl on 2021/9/6.
//  条件锁

#import "NSConditionLockDemo.h"

@interface NSConditionLockDemo ()

// 条件
@property (nonatomic, strong) NSConditionLock *conditionLock;

@property (nonatomic, strong) NSMutableArray *arr;

@end

@implementation NSConditionLockDemo

- (instancetype)init {
    if (self = [super init]) {
        
        self.conditionLock = [[NSConditionLock alloc] initWithCondition:1];
        
        self.arr = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)otherTest {
    
    // 创建两条线程分别访问remove和add
    [[[NSThread alloc] initWithTarget:self selector:@selector(__one) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__two) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__three) object:nil] start];
}

- (void)__one {
    
    [self.conditionLock lockWhenCondition:1];
    
    NSLog(@"%s", __func__);
    sleep(1);
    
    [self.conditionLock unlockWithCondition:2];
}

- (void)__two {
    [self.conditionLock lockWhenCondition:2];
    
    NSLog(@"%s", __func__);
    sleep(1);
    
    [self.conditionLock unlockWithCondition:3];
}

- (void)__three {
    [self.conditionLock lockWhenCondition:3];
    
    NSLog(@"%s", __func__);
    sleep(1);
    
    [self.conditionLock unlock];
}

- (void)NSConditionLockAPI {
    // 初始化，设置初始条件，默认为0
    NSConditionLock *conditionLock = [[NSConditionLock alloc] initWithCondition:1];
    // 加锁
    [conditionLock lock];
    // 解锁
    [conditionLock unlock];
    // 指定条件时加锁，不然就等待
    [conditionLock lockWhenCondition:1];
    // 解锁并更新条件
    [conditionLock unlockWithCondition:1];
}

@end
