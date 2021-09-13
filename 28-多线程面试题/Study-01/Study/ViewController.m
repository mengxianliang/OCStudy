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
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self interview02];
}


#pragma mark - 面试题1
- (void)interview01 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        NSLog(@"1");
        [self performSelector:@selector(print) withObject:nil afterDelay:3];
        NSLog(@"3");
    });
}



- (void)print {
    NSLog(@"2");
}


// 方法一：打开当前线程的RunLoop
- (void)test3 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        NSLog(@"1");
        [self performSelector:@selector(print) withObject:nil afterDelay:3];
        NSLog(@"3");
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    });
}

- (void)test4 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        NSLog(@"1");
        [self performSelector:@selector(print)];
        NSLog(@"3");
    });
}


#pragma mark - 面试题2
- (void)interview02 {
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"1");
    }];
    [thread start];
    
    [self performSelector:@selector(print) onThread:thread withObject:nil waitUntilDone:YES];
}

@end
