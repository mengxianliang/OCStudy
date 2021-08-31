//
//  XLThread.m
//  Study
//
//  Created by mxl on 2021/8/31.
//

#import "XLThread.h"

///** TestThread测试线程生命周期  **/
//@interface TestThread : NSThread
//
//@end
//
//@implementation TestThread
//
//- (void)dealloc {
//    NSLog(@"%s", __func__);
//}
//
//@end

@interface XLThread ()

@property (nonatomic, assign) BOOL stopRunLoop;

@property (nonatomic, strong) NSThread *thread;

@end

@implementation XLThread

- (instancetype)init {
    if (self = [super init]) {
        __weak typeof(self)weakSelf = self;
        self.thread = [[NSThread alloc] initWithBlock:^{
            NSLog(@"NSRunLoop run start %@", [NSThread currentThread]);
            // 添加source/timner/observer
            [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
            // 添加结束循环条件
            while (weakSelf && !weakSelf.stopRunLoop) {
                NSLog(@"NSRunLoop run");
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
            NSLog(@"NSRunLoop run end %@", [NSThread currentThread]);
        }];
        [self.thread start];
    }
    return self;
}

#pragma mark - 私有方法
// 停止子线程的RunLoop
- (void)stopCurrentRunLoop {
    self.stopRunLoop = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.thread = nil;
}

// 执行任务
- (void)__excuteTask:(XLThreadActionBlock)block {
    block();
}

#pragma mark - 对外方法
// 执行任务
- (void)executeTaskWithBlock:(XLThreadActionBlock)block {
    if (!self.thread) return;
    [self performSelector:@selector(__excuteTask:) onThread:self.thread withObject:block waitUntilDone:NO];
}

// 停止
- (void)stop {
    if (!self.thread) return;
    [self performSelector:@selector(stopCurrentRunLoop) onThread:self.thread withObject:nil waitUntilDone:YES];
}

// 销毁时自动停止
- (void)dealloc {
    [self stop];
    NSLog(@"%s",__func__);
}

@end
