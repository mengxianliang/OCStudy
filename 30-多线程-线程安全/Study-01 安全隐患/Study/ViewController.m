//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/24.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic, assign) int ticketsCount;

@property (nonatomic, assign) int money;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self moneyTest];
    [self saleTickets];
}

#pragma mark - 举例1：卖票
- (void)saleTickets {
    
    self.ticketsCount = 15;
    
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
    int oldTicketsCount = self.ticketsCount;
    sleep(.2);
    oldTicketsCount--;
    self.ticketsCount = oldTicketsCount;
    NSLog(@"剩余%d张票", self.ticketsCount);
}

#pragma mark - 举例2：存钱、取钱

- (void)moneyTest {
    
    self.money = 500;
    
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
    int oldMoney = self.money;
    sleep(.2);
    oldMoney += 50;
    self.money = oldMoney;
    NSLog(@"存入50还剩%d元",self.money);
}

- (void)drawMoney {
    int oldMoney = self.money;
    sleep(.2);
    oldMoney -= 20;
    self.money = oldMoney;
    NSLog(@"取出20还剩%d元",self.money);
}

@end
