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
    
    NSObject *obj = [[NSObject alloc] init];
    
//    NSString *str = @"123";
    
    id cls = [Person class];
    
    void *obj1 = &cls;
    
    [(__bridge  id)obj1 print];
    
    
    void *obj2 = &cls;
    [(__bridge  id)obj2 print];
    
    
    void *obj3 = &cls;
    [(__bridge  id)obj3 print];
}


@end
