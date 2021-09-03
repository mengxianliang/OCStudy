//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/24.
//

#import "ViewController.h"
#import "OSSpinLockDemo.h"
#import "OSUnfairLockDemo.h"
#import "MutexDemo.h"
#import "MutexDemo2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MutexDemo2 *demo = [[MutexDemo2 alloc] init];
    [demo otherTest];
    
}

@end
