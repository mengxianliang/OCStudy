//
//  NSObject+Json.h
//  Study
//
//  Created by 孟宪亮 on 2021/8/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Json)

+ (id)xl_objectWithJson:(NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END
