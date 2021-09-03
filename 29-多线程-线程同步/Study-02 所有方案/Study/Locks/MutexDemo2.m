//
//  MutexDemo2.m
//  Study
//
//  Created by mxl on 2021/9/3.
//  死锁问题、递归锁

#import "MutexDemo2.h"
#import <pthread/pthread.h>

@interface MutexDemo2 ()

@property (nonatomic, assign) pthread_mutex_t mutex;

@end

@implementation MutexDemo2

- (instancetype)init {
    if (self = [super init]) {
        [self __initMutex:&_mutex];
    }
    return self;
}

- (void)__initMutex:(pthread_mutex_t *)mutex {
    // 初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    // 设置递归类型
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
    
    // 初始化锁
    pthread_mutex_init(mutex, &attr);
    
    //销毁属性
    pthread_mutexattr_destroy(&attr);
}

int count = 0;

- (void)otherTest {
    
    NSLog(@"加锁");
    pthread_mutex_lock(&_mutex);
    

    count ++;
    NSLog(@"count = %d", count);
    if (count < 10) {
        [self otherTest];
    }
    
    NSLog(@"解锁");
    pthread_mutex_unlock(&_mutex);
}

- (void)otherTest2 {
    pthread_mutex_lock(&_mutex);
    
    NSLog(@"2");
    
    pthread_mutex_unlock(&_mutex);
}

- (void)dealloc {
    pthread_mutex_destroy(&_mutex);
}

@end
