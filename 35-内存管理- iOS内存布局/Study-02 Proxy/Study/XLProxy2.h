//
//  XLProxy2.h
//  Study
//
//  Created by mxl on 2021/9/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLProxy2 : NSProxy

@property (nonatomic, weak) id target;

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
