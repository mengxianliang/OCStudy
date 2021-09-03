//
//  OSUnfairLockDemo2.m
//  Study
//
//  Created by mxl on 2021/9/3.
//

#import "OSUnfairLockDemo2.h"
#import <os/lock.h>

@interface OSUnfairLockDemo2 ()

@property (nonatomic, assign) os_unfair_lock ticketLock;

@end

@implementation OSUnfairLockDemo2

- (instancetype)init {
    if (self = [super init]) {
        self.ticketLock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)ticketsTest {
    for (int i = 0; i < 10; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(__saleTicket) object:nil] start];
    }
}

- (void)__saleTicket {
    os_unfair_lock_lock(&_ticketLock);
    
    [super __saleTicket];
    
    os_unfair_lock_unlock(&_ticketLock);
}


@end
