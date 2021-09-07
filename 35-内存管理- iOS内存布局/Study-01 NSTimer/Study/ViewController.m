//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/24.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CADisplayLink *link;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 保证调用频率和屏幕的刷新频率相同
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(linkTest)];
    [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
}

- (void)linkTest {
    NSLog(@"%s", __func__);
}

- (void)dealloc {
    
}

@end
