//
//  SemaphoreDemo.m
//  Study
//
//  Created by mxl on 2021/9/6.
//  信号量

#import "SemaphoreDemo.h"

@interface SemaphoreDemo ()

@property (nonatomic, strong) dispatch_semaphore_t semaphore;

@property (nonatomic, strong) dispatch_semaphore_t ticketSemaphore;

@property (nonatomic, strong) dispatch_semaphore_t moneySemaphore;

@end

@implementation SemaphoreDemo

- (instancetype)init {
    if (self = [super init]) {
        // 设置最大并发数5
        self.semaphore = dispatch_semaphore_create(5);
        
        self.ticketSemaphore = dispatch_semaphore_create(1);
        
        self.moneySemaphore = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)otherTest {
    for (int i = 0; i < 20; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(test) object:nil] start];
    }
}

// 控制最大并发数
- (void)test {
    // 如果信号量的值 > 0，就让信号量的值减1，然后继续往下执行代码
    // 如果信号量饿值 <= 0，就会休眠等待，直到信号量的值大于零（等待时间由传入的时间参数决定），就让信号量的值减1，然后继续往下执行代码
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    
    sleep(2);
    NSLog(@"%s - %@",__func__, [NSThread currentThread]);
    
    // 让信号量的值+1
    dispatch_semaphore_signal(self.semaphore);
}

// 线程同步
-  (void)__saleTicket {
    dispatch_semaphore_wait(self.ticketSemaphore, DISPATCH_TIME_FOREVER);
    
    [super __saleTicket];
    
    dispatch_semaphore_signal(self.ticketSemaphore);
}


- (void)__saveMoney {
    dispatch_semaphore_wait(self.moneySemaphore, DISPATCH_TIME_FOREVER);
    
    [super __saveMoney];
    
    dispatch_semaphore_signal(self.moneySemaphore);
}

- (void)__drawMoney {
    dispatch_semaphore_wait(self.moneySemaphore, DISPATCH_TIME_FOREVER);
    
    [super __drawMoney];
    
    dispatch_semaphore_signal(self.moneySemaphore);
}

// 可以在方法内部初始化semaphore，保证每个方法使用一个semaphore
- (void)test2 {
    static dispatch_semaphore_t semaphore;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        semaphore = dispatch_semaphore_create(1);
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    // ......
    
    dispatch_semaphore_signal(semaphore);
}


// 将创建过程宏定义

// 开始并等待
#define SemaphonreBegin \
static dispatch_semaphore_t semaphore; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
    semaphore = dispatch_semaphore_create(1); \
}); \
dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

// 结束
#define SemaphonreEnd \
dispatch_semaphore_signal(semaphore);

- (void)test3 {
    SemaphonreBegin;
    
    // ......
    
    SemaphonreEnd;
}

@end
