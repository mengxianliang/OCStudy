//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/24.
//

#import "ViewController.h"
#import "NewsPresenter.h"

@interface ViewController ()

@property (nonatomic, strong) NewsPresenter *newsPresenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.newsPresenter = [[NewsPresenter alloc] init];
    self.newsPresenter.controller = self;
    [self.newsPresenter setUp];
    
}


@end
