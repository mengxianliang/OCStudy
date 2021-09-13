//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/24.
//

#import "ViewController.h"
#import "NewsViewModel.h"

@interface ViewController ()

@property (nonatomic, strong) NewsViewModel *newsViewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.newsViewModel = [[NewsViewModel alloc] init];
    self.newsViewModel.controller = self;
    [self.newsViewModel setUp];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.newsViewModel update];
}

@end
