//
//  XLGCDTimer.m
//  Study
//
//  Created by mxl on 2021/9/7.
//

#import "XLGCDTimer.h"

@implementation XLGCDTimer

// 保存所有timer的字典
static NSMutableDictionary *timers_;
// 线程保护
static dispatch_semaphore_t semaphore_;

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timers_ = [[NSMutableDictionary alloc] init];
        semaphore_ = dispatch_semaphore_create(1);
    });
}

+ (NSString *)execTask:(XLTaskBlock)task start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeats:(BOOL)repeats async:(BOOL)async {
    
    if (!task || start <0 || (interval <= 0 && repeats)) {return nil;}
    
    // 指定队列
    dispatch_queue_t queue = async ? dispatch_queue_create("timerQueue", DISPATCH_QUEUE_SERIAL) : dispatch_get_main_queue();
    // 创建定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    // 设置定时器，参数：1、timer 2、开始时间 3、间隔（纳秒） 4、误差（纳秒）
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, start * NSEC_PER_SEC), interval * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    // 加锁
    dispatch_semaphore_wait(semaphore_, DISPATCH_TIME_FOREVER);
    // 设置timerId
    NSString *name = [NSString stringWithFormat:@"%lu", timers_.count];
    // 保存定时器（保住定时器的命）
    timers_[name] = timer;
    // 解锁
    dispatch_semaphore_signal(semaphore_);
    
    // 设置回调（block）
    dispatch_source_set_event_handler(timer, ^{
        task();
        if (!repeats) {// 不重复在执行一次后取消timer
            [self cancleTask:name];
        }
    });
    // 启动定时器
    dispatch_resume(timer);
    
    // 返回id
    return name;
}

+ (NSString *)execTask:(id)target selector:(SEL)selecctor start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeats:(BOOL)repeats async:(BOOL)async {
    if (!target || !selecctor) {return nil;}
    return [self execTask:^{
        if ([target respondsToSelector:selecctor]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Warc-performSelector-leaks"
            [target performSelector:selecctor];
#pragma clang diagnostic pop
        }
    } start:start interval:interval repeats:repeats async:async];
}

+ (void)cancleTask:(NSString *)name {
    if (name.length == 0) {return;}
    
    // 加锁
    dispatch_semaphore_wait(semaphore_, DISPATCH_TIME_FOREVER);
    
    dispatch_source_t timer = timers_[name];
    if (timer) {
        dispatch_source_cancel(timer);
        [timers_ removeObjectForKey:name];
    }
    
    // 解锁
    dispatch_semaphore_signal(semaphore_);
}

@end
