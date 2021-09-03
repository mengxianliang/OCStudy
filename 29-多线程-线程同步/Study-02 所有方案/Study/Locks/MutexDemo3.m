//
//  MutexDemo3.m
//  Study
//
//  Created by mxl on 2021/9/3.
//  条件锁

#import "MutexDemo3.h"
#import <pthread/pthread.h>

@interface MutexDemo3 ()

@property (nonatomic, assign) pthread_mutex_t mutex;

// 条件
@property (nonatomic, assign) pthread_cond_t cond;

@property (nonatomic, strong) NSMutableArray *arr;

@end

@implementation MutexDemo3

- (instancetype)init {
    if (self = [super init]) {
        
        // 初始化属性
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);
        // 设置递归类型
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
        
        // 初始化锁
        pthread_mutex_init(&_mutex, &attr);
        //销毁属性
        pthread_mutexattr_destroy(&attr);
        
        // 创建条件
        pthread_cond_init(&_cond, NULL);
        
        self.arr = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)__initMutex:(pthread_mutex_t)mutex {
    
}


- (void)otherTest {
    
    NSLog(@"cond = %p, mutex = %p",&_cond, &_mutex);
    
    // 创建两条线程分别访问remove和add
    [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
    sleep(0.1);
    [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
}

/**
 1、线程1执行删除操作【加锁】
 2、发现没有数据，执行pthread_cond_wait 让线程1开始休眠，并【解锁】
 3、解锁后线程2执行添加操作【加锁】执行添加流程
 4、线程2执行pthread_cond_signal方法，通知线程1条件成立
 5、线程1节收到条件成立，从休眠中唤醒，并【加锁】继续执行删除操作，最后【解锁】
 6、线程2【解锁】
 */
// 线程一：删除数组元素
- (void)__remove {
    
    pthread_mutex_lock(&_mutex);
    NSLog(@"线程1: 【加锁】");
    
    if (self.arr.count == 0) {
        NSLog(@"线程1: 开始等待（条件不成立，开始休眠，并【解锁】）");
        pthread_cond_wait(&_cond, &_mutex);
        NSLog(@"线程1: 结束等待（接收到条件成立，【加锁】并执行后续操作）");
    }
    
    NSLog(@"线程1: 删除元素");
    [self.arr removeLastObject];
    
    NSLog(@"线程1:【解锁】");
    pthread_mutex_unlock(&_mutex);
}

// 线程二：添加数组元素
- (void)__add {
    
    pthread_mutex_lock(&_mutex);
    NSLog(@"线程2: 【加锁】");
    
    NSLog(@"线程2: 添加元素");
    [self.arr addObject:@"1"];
          
    NSLog(@"线程2: 通知线程1条件成立");
    pthread_cond_signal(&_cond);

    NSLog(@"线程2: 【解锁】");
    pthread_mutex_unlock(&_mutex);
}

- (void)dealloc {
    // 销毁锁
    pthread_mutex_destroy(&_mutex);
    
    // 销毁条件
    pthread_cond_destroy(&_cond);
}


- (void)condAPI {
    // 初始化锁
    pthread_mutex_t mutex;
    // NULL代表使用默认属性
    pthread_mutex_init(&mutex, NULL);
    
    // 初始化条件
    pthread_cond_t conditon;
    pthread_cond_init(&conditon, NULL);
    
    // 等待条件（进入休眠，放开mutex锁；被唤醒后，会再次对mutex加锁）
    pthread_cond_wait(&conditon, &mutex);
    // 激活一个等待条件的线程
    pthread_cond_signal(&conditon);
    // 激活所有等待条件的线程
    pthread_cond_broadcast(&conditon);
    
    // 销毁锁
    pthread_mutex_destroy(&mutex);
    // 销毁条件
    pthread_cond_destroy(&conditon);
}

@end
