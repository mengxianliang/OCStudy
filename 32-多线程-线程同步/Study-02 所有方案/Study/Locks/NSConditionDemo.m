//
//  NSConditionDemo.m
//  Study
//
//  Created by 孟宪亮 on 2021/9/5.
//  条件

#import "NSConditionDemo.h"

@interface NSConditionDemo ()

// 条件
@property (nonatomic, strong) NSCondition *condition;

@property (nonatomic, strong) NSMutableArray *arr;

@end

@implementation NSConditionDemo

- (instancetype)init {
    if (self = [super init]) {
        
        self.condition = [[NSCondition alloc] init];
        
        self.arr = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)otherTest {
    
    // 创建两条线程分别访问remove和add
    [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
    sleep(0.1);
    [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
}

/**
 1、线程1执行删除操作【加锁】
 2、发现没有数据，执行pthread_cond_wait 让线程1开始休眠，并【解锁】
 3、解锁后线程2执行添加操作【加锁】执行添加流程
 4、线程2执行pthread_cond_signal方法，通知线程1条件成立
 5、线程1节收到条件成立，从休眠中唤醒，并【加锁】继续执行删除操作，最后【解锁】
 6、线程2【解锁】
 */
// 线程一：删除数组元素
- (void)__remove {
    
    [self.condition lock];
    NSLog(@"线程1: 【加锁】");
    
    if (self.arr.count == 0) {
        NSLog(@"线程1: 开始等待（条件不成立，开始休眠，并【解锁】）");
        [self.condition wait];
        NSLog(@"线程1: 结束等待（接收到条件成立，【加锁】并执行后续操作）");
    }
    
    NSLog(@"线程1: 删除元素");
    [self.arr removeLastObject];
    
    NSLog(@"线程1:【解锁】");
    [self.condition unlock];
}

// 线程二：添加数组元素
- (void)__add {
    
    [self.condition lock];
    NSLog(@"线程2: 【加锁】");
    
    NSLog(@"线程2: 添加元素");
    [self.arr addObject:@"1"];
          
    NSLog(@"线程2: 通知线程1条件成立");
    [self.condition signal];

    NSLog(@"线程2: 【解锁】");
    [self.condition unlock];
}

- (void)NSConditionAPI {
    // 初始化
    NSCondition *condition = [[NSCondition alloc] init];
    // 加锁
    [condition lock];
    // 解锁
    [condition unlock];
    // 等待
    [condition wait];
    // 在设定时间钱等待
    [condition waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    // 发送信号
    [condition signal];
    // 发送广播
    [condition broadcast];
}

@end
