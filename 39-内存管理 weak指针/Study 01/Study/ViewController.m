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
    
    __strong Person* person1;
    __weak Person* person2;
    __unsafe_unretained Person* person3;
    
    NSLog(@"1");
    
    {
        Person *person = [[Person alloc] init];
        person2 = person;
    }
    
    NSLog(@"2");
}


@end
