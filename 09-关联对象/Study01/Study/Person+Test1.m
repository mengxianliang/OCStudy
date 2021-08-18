//
//  Person+Test1.m
//  Study
//
//  Created by mxl on 2021/8/13.
//

#import "Person+Test1.h"

@implementation Person (Test1)

NSMutableDictionary *dic_;
+ (void)load {
    dic_ = [[NSMutableDictionary alloc] init];
}

- (void)setWeight:(int)weight {
    NSString *key = [NSString stringWithFormat:@"%p",self];
    dic_[key] = @(weight);
}

- (int)weight {
    NSString *key = [NSString stringWithFormat:@"%p",self];
    return [dic_[key] intValue];
}

@end
