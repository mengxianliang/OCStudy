//
//  ViewController.m
//  Study
//
//  Created by 孟宪亮 on 2021/8/28.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // 获取当前runLoop
    NSRunLoop * runLoop1 = [NSRunLoop currentRunLoop];
    // 获取主runLoop
    NSRunLoop * runLoop2 = [NSRunLoop mainRunLoop];
    
    // 获取当前runLoop
    CFRunLoopRef runLoop3 = CFRunLoopGetCurrent();
    // 获取主runLoop
    CFRunLoopRef runLoop4 = CFRunLoopGetMain();
    
}

@end
