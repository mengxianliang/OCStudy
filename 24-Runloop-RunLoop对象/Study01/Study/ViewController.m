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
    
    NSLog(@"%p %p",[NSRunLoop currentRunLoop], CFRunLoopGetCurrent());
    
    NSLog(@"%@ %@",[NSRunLoop currentRunLoop], CFRunLoopGetCurrent());
}

@end
