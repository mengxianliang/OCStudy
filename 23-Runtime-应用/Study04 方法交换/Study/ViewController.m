//
//  ViewController.m
//  Study
//
//  Created by 孟宪亮 on 2021/8/28.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test2];
}

// 替换方法实现
- (void)test {
    
    Person *person = [[Person alloc] init];
    
    Method run = class_getInstanceMethod([Person class], @selector(run));
    Method replaceRun = class_getInstanceMethod([self class], @selector(replaceRun));
    
    class_replaceMethod([Person class], method_getName(run), method_getImplementation(replaceRun), method_getTypeEncoding(replaceRun));
    
    [person run];
}


- (void)replaceRun {
    NSLog(@"%s", __func__);
}

// 交换方法实现
- (void)test2 {
    Person *person = [[Person alloc] init];
    
    Method run = class_getInstanceMethod([Person class], @selector(run));
    Method walk = class_getInstanceMethod([Person class], @selector(walk));
    
    method_exchangeImplementations(run, walk);
    
    [person run];
}

@end
