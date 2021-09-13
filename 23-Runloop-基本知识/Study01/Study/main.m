//
//  main.m
//  Study
//
//  Created by 孟宪亮 on 2021/8/28.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}

// 伪代码
//int main(int argc, char * argv[]) {
//    NSString * appDelegateClassName;
//    @autoreleasepool {
//        // Setup code that might create autoreleased objects goes here.
//        appDelegateClassName = NSStringFromClass([AppDelegate class]);
//    }
//    int retVal = 0;
//    do {
//        // 睡眠等待消息
//        int message = sleep_and_wait();
//        // 处理消息
//        retVal = proess_message(message);
//    } while (retVal == 0);
//    return 0
//}
