//
//  Person.h
//  Study
//
//  Created by mxl on 2021/9/8.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Car.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, assign) int age;
@property (nonatomic, retain) Dog* dog;
@property (nonatomic, retain) Car* car;

@end

NS_ASSUME_NONNULL_END
