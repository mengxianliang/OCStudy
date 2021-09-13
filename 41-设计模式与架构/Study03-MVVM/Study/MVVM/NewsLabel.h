//
//  NewsLabel.h
//  Study
//
//  Created by mxl on 2021/9/13.
//

#import <UIKit/UIKit.h>
#import "NewsViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsLabel : UILabel

@property (nonatomic, weak) NewsViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
