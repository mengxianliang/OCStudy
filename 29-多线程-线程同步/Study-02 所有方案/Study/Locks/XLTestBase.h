//
//  XLTestBase.h
//  Study
//
//  Created by mxl on 2021/9/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLTestBase : NSObject

- (void)ticketsTest;
- (void)moneyTest;

#pragma mark - 给子类使用
- (void)__saleTicket;
- (void)__saveMoney;
- (void)__drawMoney;

@end

NS_ASSUME_NONNULL_END
