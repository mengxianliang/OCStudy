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

@property (nonatomic, strong) NSThread *thread;

@end

@implementation XLThread

- (instancetype)init {
    if (self = [super init]) {
        
        self.thread = [[NSThread alloc] initWithBlock:^{
            NSLog(@"NSRunLoop run start ------");
            // 创建上下文（要初始化一下结构体）
            CFRunLoopSourceContext context = {0};
            
            // 创建source
            CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
            
            // 往RunLoop中添加source
            CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
            
            // 销毁source
            CFRelease(source);
            
            // 启动(1.0e10是参考run方法源码),第三个参数代表执行完Source当前函数就会退出当前RunLoop
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
            
            NSLog(@"NSRunLoop run end ------");
        }];
        [self.thread start];
    }
    return self;
}

#pragma mark - 私有方法
// 停止子线程的RunLoop
- (void)stopCurrentRunLoop {
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
