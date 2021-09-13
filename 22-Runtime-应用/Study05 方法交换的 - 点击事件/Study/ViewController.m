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
    
    NSObject *obj = nil;
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [arr addObject:obj];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    [dic setObject:obj forKey:@"obj"];
    dic[@"obj"] = obj;
    
    [UIFont systemFontOfSize:17];
    
}

- (IBAction)button1:(id)sender {
    NSLog(@"%s", __func__);
}

- (IBAction)button2:(id)sender {
    NSLog(@"%s", __func__);
}

- (IBAction)button3:(id)sender {
    NSLog(@"%s", __func__);
}

@end
