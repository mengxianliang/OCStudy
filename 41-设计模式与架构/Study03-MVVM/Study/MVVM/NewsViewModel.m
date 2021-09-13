//
//  NewsPresenter.m
//  Study
//
//  Created by mxl on 2021/9/13.
//

#import "NewsViewModel.h"
#import "NewsModel.h"
#import "NewsLabel.h"

@interface NewsViewModel()

@property (nonatomic, strong) NewsLabel *newsLabel;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign) int index;

@end

@implementation NewsViewModel

- (void)setUp {
    
    // model数据
    NewsModel *model = [[NewsModel alloc] init];
    model.title = [NSString stringWithFormat:@"news-name - %d", _index];
    
    // 配置view
    self.newsLabel = [[NewsLabel alloc] initWithFrame:self.controller.view.bounds];
    self.newsLabel.text = model.title;
    self.newsLabel.font = [UIFont systemFontOfSize:30];
    self.newsLabel.textAlignment = NSTextAlignmentCenter;
    [self.controller.view addSubview:self.newsLabel];
    
    // 绑定viewModel
    self.newsLabel.viewModel = self;
}

- (void)update {
    self.index += 1;
    self.name = [NSString stringWithFormat:@"news-name - %d", _index];
    NSLog(@"self.name = %@",self.name);
}

@end
