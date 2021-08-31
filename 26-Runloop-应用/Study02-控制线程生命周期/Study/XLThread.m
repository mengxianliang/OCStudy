//
//  XLThread.m
//  Study
//
//  Created by mxl on 2021/8/31.
//

#import "XLThread.h"

/** TestThread测试线程生命周期  **/
@interface TestThread : NSThread

@end

@implementation TestThread

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end

@interface XLThread ()

@property (nonatomic, assign) BOOL stopRunLoop;

@property (nonatomic, strong) TestThread *thread;

@end

@implementation XLThread

- (instancetype)init {
    if (self = [super init]) {
        // 创建线程
        self.thread = [[TestThread alloc] initWithTarget:self selector:@selector(keepThreadAlive) object:nil];
    }
    return self;
}

#pragma mark - 私有方法
- (void)keepThreadAlive {
    NSLog(@"%@ start %s", [NSThread currentThread], __func__);
    
    // 添加source/timner/observer
    [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
    // 添加结束循环条件
    while (!self.stopRunLoop) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    
    NSLog(@"%@ end %s", [NSThread currentThread], __func__);
}

// 停止子线程的RunLoop
- (void)stopCurrentRunLoop {
    self.stopRunLoop = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.thread = nil;
}

- (void)__excuteTask:(XLThreadActionBlock)block {
    block();
}

#pragma mark - 对外方法
- (void)run {
    if (!self.thread) return;
    [self.thread start];
}

- (void)executeTaskWithBlock:(XLThreadActionBlock)block {
    if (!self.thread) return;
    [self performSelector:@selector(__excuteTask:) onThread:self.thread withObject:block waitUntilDone:NO];
}

- (void)stop {
    if (!self.thread) return;
    [self performSelector:@selector(stopCurrentRunLoop) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
