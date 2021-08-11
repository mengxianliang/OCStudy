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
    
    NSKeyValueObservingOptions options =  NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:nil];
    
    [self printClassMethodList:object_getClass(self.person1)];
    [self printClassMethodList:object_getClass(self.person2)];
    
}

- (void)printClassMethodList:(Class)cls {
    unsigned int count;
    Method *methodList = class_copyMethodList(cls, &count);
    NSMutableString *methodNames = [[NSMutableString alloc] init];
    for (int i = 0; i < count; i++) {
        Method method = methodList[i];
        [methodNames appendString:NSStringFromSelector(method_getName(method))];
        [methodNames appendString:@", "];
    }
    free(methodList);
    
    NSLog(@"%@的方法有%@", NSStringFromClass(cls), methodNames);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.person1.age = 20;
    
    // 手动触发
    [self.person1 willChangeValueForKey:@"age"];
    [self.person1 didChangeValueForKey:@"age"];
}

// 当监听属性值发生改变时调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"监听到%@的%@属性值改变 - %@", object, keyPath, change);
}

- (void)dealloc {
    [self.person1 removeObserver:self forKeyPath:@"age"];
}

@end
