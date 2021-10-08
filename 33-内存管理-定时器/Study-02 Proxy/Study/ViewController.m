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

@property (nonatomic, strong) CADisplayLink *link;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 保证调用频率和屏幕的刷新频率相同
//    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(linkTest)];
//    [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    
//    [self plan4];
    
    
    dispatch_queue_t queue = dispatch_queue_create("timer", DISPATCH_QUEUE_SERIAL);
    
    // 创建定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 设置时间
    uint64_t start = 2.0; // 2秒后开始执行
    uint64_t interval = 1.0; // 每隔1秒执行
    dispatch_source_set_timer(timer,
                              dispatch_time(DISPATCH_TIME_NOW, start * NSEC_PER_SEC),
                              interval * NSEC_PER_SEC, 0);
    
     //设置回调
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"1111");
    });
//    dispatch_source_set_event_handler_f(timer, timerFire);
    
    // 启动定时器
    dispatch_resume(timer);
    
    
}

// timer循环引用
- (void)plan0 {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];
}

// 方案一：用block，不用target
- (void)plan1 {
    __weak typeof(self)weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [weakSelf  timerTest];
    }];
}

// 方案二：消息转发(NSObject)
- (void)plan2 {
    XLProxy1 *proxy = [XLProxy1 proxyWithTarget:self];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:proxy selector:@selector(timerTest) userInfo:nil repeats:YES];
}

// 方案二：消息转发(NSProxy)
- (void)plan3 {
    XLProxy2 *proxy = [XLProxy2 proxyWithTarget:self];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:proxy selector:@selector(timerTest) userInfo:nil repeats:YES];
}


// 方案三：GCD定时器
- (void)plan4 {
//    // 获取队列
//    dispatch_queue_t queue = dispatch_get_main_queue();
//    // 创建定时器
//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//    // 设置定时器，参数：1、timer 2、开始时间 3、间隔（纳秒） 4、误差（纳秒）
//    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
//    // 设置回调
//    dispatch_source_set_event_handler(timer, ^{
//        NSLog(@"111");
//    });
//    // 启动定时器
//    dispatch_resume(timer);
}


- (void)linkTest {
    NSLog(@"%s", __func__);
}

- (void)timerTest {
    NSLog(@"%s", __func__);
}

- (void)dealloc {
    NSLog(@"%s", __func__);
//    [self.link invalidate];
    [self.timer invalidate];
}

@end
