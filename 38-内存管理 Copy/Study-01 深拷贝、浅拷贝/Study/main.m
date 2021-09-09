//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *str1 = [NSString stringWithFormat:@"abc"];
        NSString *str2 = [str1 copy];
        NSMutableString *str3 = [str1 mutableCopy];

        NSLog(@"%p %p %p", str1, str2, str3);
        
//        NSMutableString *str1 = [[NSMutableString alloc] initWithFormat:@"123"];
//        NSString *str2 = [str1 copy];
//        NSMutableString *str3 = [str1 mutableCopy];
//
//        NSLog(@"%p %p %p", str1, str2, str3);

        NSLog(@"%zd %zd", str1.retainCount, str2.retainCount);
        
        
        
        
//        [str1 release];
//        [str2 release];
//        [str3 release];
        
    }
    return 0;
}
