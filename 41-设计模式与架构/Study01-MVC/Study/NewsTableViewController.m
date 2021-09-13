//
//  NewsTableViewController.m
//  Study
//
//  Created by mxl on 2021/9/13.
//

#import "NewsTableViewController.h"
#import "NewsModel.h"

@interface NewsTableViewController ()

@property (nonatomic, strong) NSMutableArray *newsData;

@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNews];
}

- (void)loadNews {
    self.newsData = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 20; i++) {
        NewsModel *model = [[NewsModel alloc] init];
        model.title = [NSString stringWithFormat:@"news-name - %d",i];
        model.content = [NSString stringWithFormat:@"news-content - %d",i];
        [self.newsData addObject:model];
    }
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
    NewsModel *model = self.newsData[indexPath.row];
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.content;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
