//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/24.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test7];
}

// 任务：同步、异步
// 同步：在主线程执行任务
// 异步：在子线程执行任务
- (void)test1 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    // 异步执行
    dispatch_async(queue, ^{
        NSLog(@"异步执行任务 - %@", [NSThread currentThread]);
    });
    
    // 同步执行
    dispatch_sync(queue, ^{
        NSLog(@"同步执行任务 - %@", [NSThread currentThread]);
    });
}

// 队列：串行、并发
// 并发：允许多个任务同时执行，会自动创建子线程，只能异步执行
// 并发：
- (void)test2 {
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"执行任务1 - %@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"执行任务2 - %@", [NSThread currentThread]);
        }
    });
}

// 串行：
- (void)test3 {
    // GCD不用调用release方法
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    // 异步执行
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"执行任务1 - %@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"执行任务2 - %@", [NSThread currentThread]);
        }
    });
}

@end
