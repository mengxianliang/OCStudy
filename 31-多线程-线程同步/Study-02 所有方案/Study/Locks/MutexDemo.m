//
//  MutexDemo.m
//  Study
//
//  Created by mxl on 2021/9/3.
//

#import "MutexDemo.h"
#import <pthread/pthread.h>

@interface MutexDemo ()

@property (nonatomic, assign) pthread_mutex_t ticketLock;

@property (nonatomic, assign) pthread_mutex_t moneyLock;

@end

@implementation MutexDemo

- (instancetype)init {
    if (self = [super init]) {
        [self __initMutex:&_ticketLock];
        [self __initMutex:&_moneyLock];
    }
    return self;
}

- (void)__initMutex:(pthread_mutex_t *)mutex {
    // 初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    // 设置默认类型
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    
    // 初始化锁
    pthread_mutex_init(mutex, &attr);
    
    //销毁属性
    pthread_mutexattr_destroy(&attr);
}

- (void)__saleTicket {
    
    pthread_mutex_lock(&_ticketLock);
    
    [super __saleTicket];
    
    pthread_mutex_unlock(&_ticketLock);
}

- (void)__saveMoney {
    pthread_mutex_lock(&_ticketLock);
    
    [super __saveMoney];
    
    pthread_mutex_unlock(&_ticketLock);
}

- (void)__drawMoney {
    pthread_mutex_lock(&_ticketLock);
    
    [super __drawMoney];
    
    pthread_mutex_unlock(&_ticketLock);
}

- (void)dealloc {
    pthread_mutex_destroy(&_ticketLock);
    pthread_mutex_destroy(&_moneyLock);
}

- (void)MutexAPI {
    // 初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    // 设置默认类型
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    
    // 初始化锁
    pthread_mutex_t mutex;
    pthread_mutex_init(&mutex, &attr);
    
    // 尝试加锁
    pthread_mutex_trylock(&mutex);
    // 加锁
    pthread_mutex_lock(&mutex);
    // 解锁
    pthread_mutex_unlock(&mutex);
    
    // 销毁属性
    pthread_mutexattr_destroy(&attr);
    // 销毁锁
    pthread_mutex_destroy(&mutex);
}

@end
