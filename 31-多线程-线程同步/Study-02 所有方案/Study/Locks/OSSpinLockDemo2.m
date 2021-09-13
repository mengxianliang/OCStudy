//
//  OSSpinLockDemo2.m
//  Study
//
//  Created by mxl on 2021/9/3.
//  原理探究

#import "OSSpinLockDemo2.h"
#import <libkern/OSAtomic.h>

@interface OSSpinLockDemo2 ()

@property (nonatomic, assign) OSSpinLock ticketLock;

@end

@implementation OSSpinLockDemo2

- (instancetype)init {
    if (self = [super init]) {
        self.ticketLock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)ticketsTest {
    for (int i = 0; i < 10; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(__saleTicket) object:nil] start];
    }
}

-  (void)__saleTicket {
    OSSpinLockLock(&_ticketLock);

    [super __saleTicket];
    
    OSSpinLockUnlock(&_ticketLock);
}




@end
