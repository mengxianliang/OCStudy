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
    NSLock *lock = [[NSLock alloc] init];
    [lock lock];
    [lock unlock];
    [lock tryLock];
    [lock lockBeforeDate:[NSDate dateWithTimeIntervalSinceNow:1]];
}

@end
