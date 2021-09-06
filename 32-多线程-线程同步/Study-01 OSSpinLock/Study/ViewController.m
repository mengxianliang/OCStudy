//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/24.
//

#import "ViewController.h"
#import <libkern/OSAtomic.h>

@interface ViewController ()

@property (nonatomic, assign) int ticketsCount;

@property (nonatomic, assign) int money;

@property (nonatomic, assign) OSSpinLock ticketLock;

@property (nonatomic, assign) OSSpinLock moneyLock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self ticketsTest];
    [self moneyTest];
}

#pragma mark - 举例1：卖票
- (void)ticketsTest {
    
    self.ticketsCount = 15;
    
    // 初始化一把锁
    self.ticketLock = OS_SPINLOCK_INIT;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
}

- (void)saleTicket {
    
    // 加锁
    OSSpinLockLock(&_ticketLock);
    
    int oldTicketsCount = self.ticketsCount;
    sleep(.2);
    oldTicketsCount--;
    self.ticketsCount = oldTicketsCount;
    NSLog(@"剩余%d张票", self.ticketsCount);
    
    // 解锁
    OSSpinLockUnlock(&_ticketLock);
}

#pragma mark - 举例2：存钱、取钱

- (void)moneyTest {
    
    self.money = 500;
    
    // 初始化一把锁
    self.moneyLock = OS_SPINLOCK_INIT;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    // 每次存入50，存10次，共500快
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self saveMoney];
        }
    });
    
    // 每次取出20，存10次，共200快
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self drawMoney];
        }
    });
    
    // 正常情况剩余应该是 500 + 500 - 200 = 800
}

- (void)saveMoney {
    
    // 加锁
    OSSpinLockLock(&_ticketLock);
    
    int oldMoney = self.money;
    sleep(.2);
    oldMoney += 50;
    self.money = oldMoney;
    NSLog(@"存入50还剩%d元",self.money);
    
    // 解锁
    OSSpinLockUnlock(&_ticketLock);
}

- (void)drawMoney {
    
    // 加锁
    OSSpinLockLock(&_ticketLock);
    
    int oldMoney = self.money;
    sleep(.2);
    oldMoney -= 20;
    self.money = oldMoney;
    NSLog(@"取出20还剩%d元",self.money);
    
    // 解锁
    OSSpinLockUnlock(&_ticketLock);
}

@end
