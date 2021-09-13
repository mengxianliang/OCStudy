//
//  SerialQueueDemo.m
//  Study
//
//  Created by mxl on 2021/9/6.
//  串行队列解决线程同步

#import "SerialQueueDemo.h"

@interface SerialQueueDemo ()

@property (nonatomic, strong) dispatch_queue_t ticketQueue;

@property (nonatomic, strong) dispatch_queue_t moneyQueue;

@end

@implementation SerialQueueDemo

- (instancetype)init {
    if (self = [super init]) {
        self.ticketQueue = dispatch_queue_create("ticketQueue", DISPATCH_QUEUE_SERIAL);
        self.moneyQueue = dispatch_queue_create("moneyQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

-  (void)__saleTicket {
    dispatch_sync(self.ticketQueue, ^{
        [super __saleTicket];
    });
}


- (void)__saveMoney {
    dispatch_sync(self.moneyQueue, ^{
        [super __saveMoney];
    });
}

- (void)__drawMoney {
    dispatch_sync(self.moneyQueue, ^{
        [super __drawMoney];
    });
}


@end
