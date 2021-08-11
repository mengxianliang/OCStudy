//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/11.
//

#import "ViewController.h"
#import <objc/runtime.h>

#import "Person.h"


@interface ViewController ()

@property (nonatomic, strong) Person *person1;

@property (nonatomic, strong) Person *person2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.person1 = [[Person alloc] init];
    self.person1.age = 11;
    
    self.person2 = [[Person alloc] init];
    self.person2.age = 12;
    
    NSLog(@"添加KVO前 - person1.setAge = %p, person2.setAge = %p",[self.person1 methodForSelector:@selector(setAge:)],[self.person2 methodForSelector:@selector(setAge:)]);

    NSLog(@"添加KVO前 - person1.isa = %@, person2.isa = %@",object_getClass(self.person1),object_getClass(self.person2));
    
    NSKeyValueObservingOptions options =  NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:nil];
    
    NSLog(@"添加KVO后 - person1.isa = %@, person2.isa = %@",object_getClass(self.person1),object_getClass(self.person2));

    NSLog(@"添加KVO后 - person1.setAge = %p, person2.setAge = %p",[self.person1 methodForSelector:@selector(setAge:)],[self.person2 methodForSelector:@selector(setAge:)]);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.person1.age = 20;
}

// 当监听属性值发生改变时调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"监听到%@的%@属性值改变 - %@", object, keyPath, change);
}

- (void)dealloc {
    [self.person1 removeObserver:self forKeyPath:@"age"];
}

@end
