//
//  SynchronizedDemo.m
//  Study
//
//  Created by mxl on 2021/9/6.
//

#import "SynchronizedDemo.h"


@interface SynchronizedDemo ()

@property (nonatomic, copy) NSString *ticketToken;

@property (nonatomic, copy) NSString *moneyToken;

@end

@implementation SynchronizedDemo

- (instancetype)init {
    if (self = [super init]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            self.ticketToken = @"1";
            self.moneyToken = @"2";
        });
    }
    return self;
}

-  (void)__saleTicket {
    
    @synchronized (self.ticketToken) {
        
        [super __saleTicket];
        
    }
}


- (void)__saveMoney {
    @synchronized (self.moneyToken) {
        
        [super __saveMoney];
        
    }
}

- (void)__drawMoney {
    
    // @synchronized(self){}
    @synchronized (self.moneyToken) {
        
        [super __drawMoney];
        
    }
}

@end
