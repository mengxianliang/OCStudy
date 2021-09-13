//
//  NewsLabel.m
//  Study
//
//  Created by mxl on 2021/9/13.
//

#import "NewsLabel.h"
#import "NSObject+FBKVOController.h"

@implementation NewsLabel

- (void)setViewModel:(NewsViewModel *)viewModel {
    _viewModel = viewModel;
    
    // 添加绑定
    __weak typeof(self)weakSelf = self;
    [self.KVOController observe:viewModel keyPath:@"name" options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
        weakSelf.text = change[NSKeyValueChangeNewKey];
    }];
}

@end
