//
//  OSSpinLockDemo.m
//  Study
//
//  Created by mxl on 2021/9/2.
//

#import "OSSpinLockDemo.h"
#import <libkern/OSAtomic.h>

@interface OSSpinLockDemo ()

@property (nonatomic, assign) OSSpinLock moneyLock;

@property (nonatomic, assign) OSSpinLock ticketLock;

@end

@implementation OSSpinLockDemo

- (instancetype)init {
    if (self = [super init]) {
        self.moneyLock = OS_SPINLOCK_INIT;
        self.ticketLock = OS_SPINLOCK_INIT;
    }
    return self;
}

-  (void)__saleTicket {
    OSSpinLockLock(&_ticketLock);

    [super __saleTicket];
    
    OSSpinLockUnlock(&_ticketLock);
    
}


- (void)__saveMoney {
    
    OSSpinLockLock(&_ticketLock);

    [super __saveMoney];
    
    OSSpinLockUnlock(&_ticketLock);
    
}

- (void)__drawMoney {
    
    OSSpinLockLock(&_ticketLock);

    [super __drawMoney];
    
    OSSpinLockUnlock(&_ticketLock);
    
}




@end
