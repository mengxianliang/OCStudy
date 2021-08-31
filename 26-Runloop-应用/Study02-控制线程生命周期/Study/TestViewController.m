//
//  TestViewController.m
//  Study
//
//  Created by mxl on 2021/8/31.
//

#import "TestViewController.h"
#import "XLThread.h"

@interface TestViewController ()

@property (nonatomic, strong) XLThread *thread;

@property (nonatomic, assign) BOOL stopRunLoop;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor purpleColor];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
//    __weak typeof(self)weakSelf = self;
//    self.thread = [[XLThread alloc] initWithTarget:weakSelf selector:@selector(keepThreadAlive) object:nil];
//    [self.thread start];
    
}

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
}

// 线程真正执行的逻辑
- (void)run {
    NSLog(@"%s - %@",__func__, [NSThread currentThread]);
}

- (void)back {
//    [self performSelector:@selector(stopCurrentRunLoop) onThread:self.thread withObject:nil waitUntilDone:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self performSelector:@selector(run) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
