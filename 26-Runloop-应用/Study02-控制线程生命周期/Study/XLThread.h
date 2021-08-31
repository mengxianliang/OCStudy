//
//  XLThread.h
//  Study
//
//  Created by mxl on 2021/8/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^XLThreadActionBlock)(void);

@interface XLThread : NSThread

/**
 开启线程
 */
- (void)run;

/**
 执行任务 - block 方法
 */
- (void)executeTaskWithBlock:(XLThreadActionBlock)block;

/**
 停止线程
 */
- (void)stop;

@end

NS_ASSUME_NONNULL_END
