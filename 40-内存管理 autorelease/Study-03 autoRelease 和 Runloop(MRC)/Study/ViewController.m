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
    
//    {
//        Person *person = [[[Person alloc] init] autorelease];
//    }
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(doSomeThing) object:nil];
    [thread start];
     
    NSLog(@"%s", __func__);
}

- (void)doSomeThing {
    NSLog(@"%s %@ ", __func__, [NSThread currentThread]);
    
    @autoreleasepool {
        
    }
    
    Person *person = [[[Person alloc] init] autorelease];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"%s", __func__);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"%s", __func__);
}


@end
