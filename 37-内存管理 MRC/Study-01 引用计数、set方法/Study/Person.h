//
//  Person.h
//  Study
//
//  Created by mxl on 2021/9/8.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject {
    Dog *_dog;
}

- (void)setDog:(Dog *)dog;

- (Dog *)dog;

@end

NS_ASSUME_NONNULL_END
