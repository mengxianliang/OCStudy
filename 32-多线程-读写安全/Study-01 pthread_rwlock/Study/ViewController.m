//
//  ViewController.m
//  Study
//
//  Created by mxl on 2021/8/24.
//

#import "ViewController.h"
#import <pthread/pthread.h>

@interface ViewController ()

@property (nonatomic, assign) pthread_rwlock_t lock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化锁
    pthread_rwlock_init(&_lock, NULL);
    
    for (int i = 0; i < 20; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(read) object:nil] start];
        [[[NSThread alloc] initWithTarget:self selector:@selector(write) object:nil] start];
    }
}

- (void)read {
    pthread_rwlock_rdlock(&_lock);
    
    NSLog(@"%s", __func__);
    sleep(1);
    
    pthread_rwlock_unlock(&_lock);
}

- (void)write {
    pthread_rwlock_wrlock(&_lock);
    
    NSLog(@"%s", __func__);
    sleep(1);
    
    pthread_rwlock_unlock(&_lock);
}

- (void)dealloc {
    pthread_rwlock_destroy(&_lock);
}

- (void)rwlockAPI {
    // 初始化
    pthread_rwlock_t lock;
    pthread_rwlock_init(&lock, NULL);
    
    // 读-加锁
    pthread_rwlock_rdlock(&lock);
    // 读-尝试加锁
    pthread_rwlock_tryrdlock(&lock);
    
    // 写-加锁
    pthread_rwlock_wrlock(&lock);
    // 写-尝试加锁
    pthread_rwlock_trywrlock(&lock);
    
    // 解锁
    pthread_rwlock_unlock(&lock);
    // 销毁
    pthread_rwlock_destroy(&lock);
}


@end
