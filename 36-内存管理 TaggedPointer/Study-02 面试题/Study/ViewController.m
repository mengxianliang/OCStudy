//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/24.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic, copy) NSString *name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    for (int i = 0; i < 1000; i++) {
//        dispatch_async(queue, ^{
//            self.name = [NSString stringWithFormat:@"abc"];
////            NSLog(@"self.name = %@, %@",self.name, [NSThread currentThread]);
//        });
//    }
    
    
    NSString *str1 = [NSString stringWithFormat:@"abc"];
    
    NSString *str2 = [NSString stringWithFormat:@"abcdeghijk"];
    
    NSLog(@"%p %p", str1, str2);
    NSLog(@"%@ %@", [str1 class], [str2 class]);
    
}

//- (void)setName:(NSString *)name {
//    if (_name != name) {
//        [_name release];
//        _name = [name retain];
//    }
//}


@end
