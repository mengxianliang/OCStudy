//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/20.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    NSLog(@"start");
    Person *person = [[Person alloc] init];
    __weak Person* weakPerson = person;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakPerson test];
    });
}


@end
