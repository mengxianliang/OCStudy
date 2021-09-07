//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/24.
//

#import "ViewController.h"
#import "XLProxy1.h"
#import "XLProxy2.h"

@interface ViewController ()

@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startTimer];
}

// 方案三：GCD定时器
- (void)startTimer {
    
    // 获取队列
    dispatch_queue_t queue = dispatch_get_main_queue();
//    // 其他队列
//    dispatch_queue_t queue = dispatch_queue_create("timerQueue", DISPATCH_QUEUE_SERIAL);
    // 创建定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    // 设置开始时间 2秒后
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC);
    // 设置定时器，参数：1、timer 2、开始时间 3、间隔（纳秒） 4、误差（纳秒）
    dispatch_source_set_timer(timer, start, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
//    // 设置回调（block）
//    dispatch_source_set_event_handler(timer, ^{
//        NSLog(@"111");
//    });
    // 设置回掉（函数）
    dispatch_source_set_event_handler_f(timer, timerFire);
    // 启动定时器
    dispatch_resume(timer);
    
    // 保住定时器的命
    self.timer = timer;
}

void timerFire(void *param) {
    NSLog(@"222");
}

@end
