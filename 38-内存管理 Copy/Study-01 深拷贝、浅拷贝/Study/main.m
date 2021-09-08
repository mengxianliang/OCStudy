//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        NSString *str1 = [NSString stringWithFormat:@"abc"];
//        NSString *str2 = [str1 copy];
//        NSMutableString *str3 = [str1 mutableCopy];
//
//        NSLog(@"%p %p %p", str1, str2, str3);
        
        NSMutableString *str1 = [[NSMutableString alloc] initWithFormat:@"abc"];
        NSString *str2 = [str1 copy];
        NSMutableString *str3 = [str1 mutableCopy];

        NSLog(@"%p %p %p", str1, str2, str3);
        
        
    }
    return 0;
}
