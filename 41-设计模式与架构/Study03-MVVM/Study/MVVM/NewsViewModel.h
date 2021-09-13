//
//  NewsPresenter.h
//  Study
//
//  Created by mxl on 2021/9/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsViewModel : NSObject

@property (nonatomic, weak) UIViewController *controller;

- (void)setUp;

- (void)update;

@end

NS_ASSUME_NONNULL_END
