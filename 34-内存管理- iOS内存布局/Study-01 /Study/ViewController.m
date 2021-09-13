//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


// 数据段：2已初始化的全局变量
int a = 1;

// 数据段：3未初始化的全局变量
int b;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 数据段：1字符串常量
    NSString *str = @"123";
    
    // 数据段：2已初始化的静态变量
    static int c = 1;
    
    // 数据段：3未初始化的静态变量
    static int d;
    
    // 栈：局部变量（地址越来越小）
    int e = 1;
    int f = 2;
    
    // 堆：alloc的对象（地址越来越大）
    NSObject *obj1 = [[NSObject alloc] init];
    NSObject *obj2 = [[NSObject alloc] init];
    
    NSLog(@"\n &a = %p\n &b = %p\n &c = %p\n &d = %p\n &e = %p\n &f = %p\n str = %p\n obj1 = %p\n obj2 = %p\n",&a,&b,&c,&d,&e,&f,str,obj1,obj2);
    
}
/**
 
 数据段：字符串常量
 str = 0x10d4ef020
 
 数据段：已初始化的静态变量、全局变量
 &a = 0x10d4f44c0
 &c = 0x10d4f44c4

 数据段：未初始化的静态变量、全局变量
 &d = 0x10d4f4648
 &b = 0x10d4f464c
 
 堆：
 obj1 = 0x600002190320
 obj2 = 0x600002190330
 
 栈：局部变量
 &e = 0x7ffee2711264
 &f = 0x7ffee2711260
 
 */

@end
