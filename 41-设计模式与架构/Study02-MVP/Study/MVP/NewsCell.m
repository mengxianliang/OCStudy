//
//  NewsCell.m
//  Study
//
//  Created by mxl on 2021/9/13.
//

#import "NewsCell.h"

@implementation NewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    }
    return self;
}

- (void)setModel:(NewsModel *)model {
    _model = model;
    
    self.textLabel.text = model.title;
    self.detailTextLabel.text = model.content;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
