//
//  NSObject+Json.m
//  Study
//
//  Created by 孟宪亮 on 2021/8/28.
//

#import "NSObject+Json.h"
#import <objc/runtime.h>

@implementation NSObject (Json)

+ (id)xl_objectWithJson:(NSDictionary *)json {
    id obj = [[self alloc] init];
    
    unsigned int count;
    Ivar *ivars = class_copyIvarList(self, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        NSMutableString *ivarName = [NSMutableString stringWithUTF8String:ivar_getName(ivar)];
        [ivarName deleteCharactersInRange:NSMakeRange(0, 1)];
        
        [obj setValue:json[ivarName] forKey:ivarName];
    }
    
    
    return obj;
}

@end
