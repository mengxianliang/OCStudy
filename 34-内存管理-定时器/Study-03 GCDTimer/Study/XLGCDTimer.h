//
//  XLGCDTimer.h
//  Study
//
//  Created by mxl on 2021/9/7.
//

#import <Foundation/Foundation.h>

typedef void(^XLTaskBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface XLGCDTimer : NSObject


/// 自定义GCD定时器
/// @param task 执行任务
/// @param start 开始时间
/// @param interval 间隔
/// @param repeats 是否重复
/// @param async 是否异步执行
+ (NSString *)execTask:(XLTaskBlock)task start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeats:(BOOL)repeats async:(BOOL)async;

+ (void)cancleTask:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
