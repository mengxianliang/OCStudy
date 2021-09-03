//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/24.
//

#import "ViewController.h"
#import "OSSpinLockDemo.h"
#import "OSSpinLockDemo2.h"
#import "OSUnfairLockDemo.h"
#import "OSUnfairLockDemo2.h"
#import "MutexDemo.h"
#import "MutexDemo2.h"
#import "MutexDemo3.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MutexDemo3 *demo = [[MutexDemo3 alloc] init];
    [demo otherTest];
    
}

@end
