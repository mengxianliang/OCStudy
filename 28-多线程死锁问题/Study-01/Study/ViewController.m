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

// 死锁问题
// 以下代码在主线程执行，会不会产生死锁？
- (void)test4 {
    
    NSLog(@"1");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        NSLog(@"2");
    });
    
    NSLog(@"3");
}

- (void)test5 {
    
    NSLog(@"1");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        NSLog(@"2");
    });
    NSLog(@"3");
}

- (void)test6 {
    NSLog(@"1");
    
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"2");
        
        dispatch_sync(queue, ^{
            NSLog(@"3");
        });
        
        NSLog(@"4");
    });
    
    NSLog(@"5");
}

- (void)test7 {
    NSLog(@"1");
    
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"2 %@", [NSThread currentThread]);
        
        dispatch_sync(queue, ^{
            NSLog(@"3 %@", [NSThread currentThread]);
        });
        
        NSLog(@"4 %@", [NSThread currentThread]);
    });
    
    NSLog(@"5");
}

@end
