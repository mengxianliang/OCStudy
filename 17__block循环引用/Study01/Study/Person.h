//
//  Person.h
//  Study
//
//  Created by 孟宪亮 on 2021/8/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^XLBlock)(void);

@interface Person : NSObject

@property (nonatomic, copy) XLBlock block;

- (void)test;

@end

NS_ASSUME_NONNULL_END
