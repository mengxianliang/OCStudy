//
//  NSLockDemo.m
//  Study
//
//  Created by 孟宪亮 on 2021/9/5.
//

#import "NSLockDemo.h"

@interface NSLockDemo ()

@property (nonatomic, strong) NSLock *ticketLock;

@property (nonatomic, strong) NSLock *moneyLock;

@end

@implementation NSLockDemo

- (instancetype)init {
    if (self = [super init]) {
        self.ticketLock = [[NSLock alloc] init];
        self.moneyLock = [[NSLock alloc] init];
    }
    return self;
}

- (void)__saleTicket {
    
    [self.ticketLock lock];
    
    [super __saleTicket];
    
    [self.ticketLock unlock];
}

- (void)__saveMoney {
    [self.moneyLock lock];
    
    [super __saveMoney];
    
    [self.moneyLock unlock];

}

- (void)__drawMoney {
    [self.moneyLock lock];
    
    [super __drawMoney];
    
    [self.moneyLock unlock];

}

- (void)NSLockAPI {
//    // 初始化属性
//    pthread_mutexattr_t attr;
//    pthread_mutexattr_init(&attr);
//    // 设置默认类型
//    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
//
//    // 初始化锁
//    pthread_mutex_t mutex;
//    pthread_mutex_init(&mutex, &attr);
//
//    // 尝试加锁
//    pthread_mutex_trylock(&mutex);
//    // 加锁
//    pthread_mutex_lock(&mutex);
//    // 解锁
//    pthread_mutex_unlock(&mutex);
//
//    // 销毁属性
//    pthread_mutexattr_destroy(&attr);
//    // 销毁锁
//    pthread_mutex_destroy(&mutex);
}

@end
