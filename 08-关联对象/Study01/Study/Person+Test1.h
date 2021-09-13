//
//  Person+Test1.h
//  Study
//
//  Created by mxl on 2021/8/13.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (Test1)
//{
//    int _weight;
//}

// 分类里添加属性，只会自动添加方法声明，没有实现。
@property (nonatomic, assign) int weight;


@end

NS_ASSUME_NONNULL_END
