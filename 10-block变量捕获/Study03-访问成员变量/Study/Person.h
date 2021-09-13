//
//  Person.h
//  Study
//
//  Created by mxl on 2021/8/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithName:(NSString *)name;

- (void)test;

@end

NS_ASSUME_NONNULL_END
