//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/24.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSObject *obj = [[NSObject alloc] init];
//
    
    
    struct objc_super sp = {
        self,
        [UIViewController class]
    };
    
    id cls = [Person class];

    void *obj1 = &cls;
    [(__bridge  id)obj1 print];
    
    Person *person = [[Person alloc] init];
    person.age = 10;
    person.weight = 20;
    person.name = [[NSString alloc] init];
    
    NSLog(@"person->isa adress = %p,person->_name adress = %p",object_getClass(person),person.name);
    
    int a1 = 1;
    int a2 = 1;
    int a3 = 1;
    NSLog(@"a1 = %p,a2 = %p,a3 = %p", &a1, &a2, &a3);
    
}


@end
