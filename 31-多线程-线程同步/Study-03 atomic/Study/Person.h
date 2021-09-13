//
//  Person.h
//  Study
//
//  Created by mxl on 2021/9/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (atomic, copy) NSString *name;

@property (atomic, assign) int age;

@property (atomic, strong) NSMutableArray *data;

@end

NS_ASSUME_NONNULL_END
