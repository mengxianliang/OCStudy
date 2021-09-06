//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/24.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *person = [[Person alloc] init];
    
    // 线程安全，调用set/get方法
    person.data = [[NSMutableArray alloc] init];
    
    // 线程不安全，直接修改属性内容
    [person.data addObject:@"1"];
    [person.data addObject:@"2"];
    [person.data addObject:@"3"];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

@end
