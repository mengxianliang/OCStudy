//
//  NewsPresenter.m
//  Study
//
//  Created by mxl on 2021/9/13.
//

#import "NewsPresenter.h"
#import "NewsModel.h"
#import "NewsCell.h"

@interface NewsPresenter()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *newsData;

@end

@implementation NewsPresenter

- (void)setUp {
    
    self.newsData = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 20; i++) {
        NewsModel *model = [[NewsModel alloc] init];
        model.title = [NSString stringWithFormat:@"news-name - %d",i];
        model.content = [NSString stringWithFormat:@"news-content - %d",i];
        [self.newsData addObject:model];
    }
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.controller.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[NewsCell class] forCellReuseIdentifier:@"NewsCell"];
    [self.controller.view addSubview:self.tableView];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"NewsCell"];
    }
    cell.model = self.newsData[indexPath.row];
    return cell;
}


@end
