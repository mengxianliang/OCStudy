//
//  ViewController.m
//  Study
//
//  Created by 孟宪亮 on 2021/8/28.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"
#import "NSObject+Json.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
    
    
}


- (void)test {
    NSDictionary *json = @{
        @"age" : @20,
        @"weight" : @60,
        @"name" : @"Jack"
    };
    
    Person *person = [Person xl_objectWithJson:json];
    
    
    
    
}

- (void)testFieldTest {
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = @"test text filed";
    
    unsigned int count;
    Ivar *ivars = class_copyIvarList([UITextField class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        NSLog(@"%s", ivar_getName(ivar));
    }
    
//    id label = [textField valueForKey:@"_placeholderLabel"];
    
    Ivar ivar = class_getInstanceVariable([UITextField class], "_placeholderLabel");
    UILabel* label = object_getIvar(textField, ivar);
    label.textColor = [UIColor redColor];
    
    NSLog(@"label = %@", label);
}

@end
