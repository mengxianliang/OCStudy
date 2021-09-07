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

+ (NSString *)execTask:(XLTaskBlock)task start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeats:(BOOL)repeats async:(BOOL)async;

+ (NSString *)execTask:(id)target selector:(SEL)selecctor start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeats:(BOOL)repeats async:(BOOL)async;

+ (void)cancleTask:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
