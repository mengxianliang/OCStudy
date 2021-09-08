//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

/**
 通过位运算，拿到最后一个位
  0b 0000 0111
 &0b 0000 0001
 ---------------
  0b 0000 0001
 */
BOOL isTaggedPointer(id pointer)
{
    return (long)(__bridge void*)pointer & 1;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 创建NSNumber对象
//        NSNumber *number = [NSNumber numberWithInt:10];
//        number = @(10);
//        number = @10;
        
        NSNumber *number1 = @4;
        
        NSNumber *number2 = @5;
        
        NSNumber *number3 = @(0xFFFFFFFFFFFFFFFF);
        
        
        NSLog(@"%p %p %p",number1, number2, number3);
        
        /**
         0xf5a13d559ead6e0d
         0xf5a13d559ead6f0d
         0xf5a13d559ead680d
         0xf5a13d559ead690d
         */
        
        for (int i = 0; i < 10; i++) {
            NSObject *obj = [[NSObject alloc] init];
            NSLog(@"&obj = %p, obj = %p", &obj, obj);
        }
        
    }
    return 0;
}
