//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/24.
//

#import "ViewController.h"
#import "OSSpinLockDemo.h"


@interface ViewController ()

@property (nonatomic, strong) OSSpinLockDemo *spinLockDemo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OSSpinLockDemo *demo = [[OSSpinLockDemo alloc] init];
    [demo ticketsTest];
    [demo moneyTest];
    
}

@end
