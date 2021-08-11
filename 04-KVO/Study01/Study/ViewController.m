//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/11.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.person = [[Person alloc] init];
    self.person.age = 10;
    
    NSKeyValueObservingOptions options =  NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person addObserver:self forKeyPath:@"age" options:options context:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.person.age = 20;
}

// 当监听属性值发生改变时调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"监听到%@的%@属性值改变 - %@", object, keyPath, change);
}

- (void)dealloc {
    [self.person removeObserver:self forKeyPath:@"age"];
}

@end
