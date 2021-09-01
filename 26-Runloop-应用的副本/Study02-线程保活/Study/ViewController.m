//
//  ViewController.m
//  Study
//
//  Created by 孟宪亮 on 2021/8/28.
//

#import "ViewController.h"
#import "XLThread.h"

@interface ViewController ()

@property (nonatomic, strong) XLThread *thread;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.thread = [[XLThread alloc] initWithTarget:self selector:@selector(keepThreadAlive) object:nil];
    [self.thread start];
}

- (void)keepThreadAlive {
    NSLog(@"%@ start %s", [NSThread currentThread], __func__);

    // 添加source/timner/observer
    [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];

    NSLog(@"%@ end %s", [NSThread currentThread], __func__);
}

// 线程真正执行的逻辑
- (void)run {
    NSLog(@"%s - %@",__func__, [NSThread currentThread]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self performSelector:@selector(run) onThread:self.thread withObject:nil waitUntilDone:YES];
}

@end
