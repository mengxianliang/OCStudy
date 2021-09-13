//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/24.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.queue = dispatch_queue_create("rw_queue", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0; i < 20; i++) {
        [self read];
        
        [self write];
    }
}

- (void)read {
    dispatch_async(self.queue, ^{
        NSLog(@"%s", __func__);
        sleep(1);
    });
}

- (void)write {
    dispatch_barrier_async(self.queue, ^{
        NSLog(@"%s", __func__);
        sleep(1);
    });
}

@end
