//
//  Person.h
//  Study
//
//  Created by 孟宪亮 on 2021/8/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<NSCoding, NSCopying>

//@property (nonatomic, assign) int age;
//
//@property (nonatomic, assign) int weight;

- (void)testSelf:(id)self _cmd:(SEL)_cmd;
- (void)test;

- (void)testAge:(int)age height:(int)height;

//- (void)testAge:(int)age height:(int)height self:(id)self _cmd:(SEL)_cmd;

@end

NS_ASSUME_NONNULL_END
