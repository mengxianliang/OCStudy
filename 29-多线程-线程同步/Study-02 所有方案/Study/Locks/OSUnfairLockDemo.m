//
//  OSUnfairLockDemo.m
//  Study
//
//  Created by mxl on 2021/9/3.
//

#import "OSUnfairLockDemo.h"
#import <os/lock.h>

@interface OSUnfairLockDemo ()

@property (nonatomic, assign) os_unfair_lock moneyLock;

@property (nonatomic, assign) os_unfair_lock ticketLock;

@end

@implementation OSUnfairLockDemo

- (instancetype)init {
    if (self = [super init]) {
        self.moneyLock = OS_UNFAIR_LOCK_INIT;
        self.ticketLock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)__saleTicket {
    os_unfair_lock_lock(&_ticketLock);
    
    [super __saleTicket];
    
    os_unfair_lock_unlock(&_ticketLock);
}

- (void)__saveMoney {
    os_unfair_lock_lock(&_moneyLock);
    
    [super __saveMoney];
    
    os_unfair_lock_unlock(&_moneyLock);
}

- (void)__drawMoney {
    os_unfair_lock_lock(&_moneyLock);
    
    [super __drawMoney];
    
    os_unfair_lock_unlock(&_moneyLock);
    
}

- (void)API {
    // 初始化
    os_unfair_lock lock = OS_UNFAIR_LOCK_INIT;
    // 尝试加锁
    BOOL result = os_unfair_lock_trylock(&lock);
    // 加锁
    os_unfair_lock_lock(&lock);
    // 解锁
    os_unfair_lock_unlock(&lock);
}


@end
