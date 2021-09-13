//
//  Person+Test1.m
//  Study
//
//  Created by mxl on 2021/8/13.
//

#import "Person+Test1.h"
#import <objc/runtime.h>

@implementation Person (Test1)


- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY);
}

- (NSString *)name {
    return objc_getAssociatedObject(self, _cmd);
}

- (NSString *)nameSelf:(id)self cmd:(SEL):_cmd {
    
}

//#define NameKey @"name"
//- (void)setName:(NSString *)name {
//    objc_setAssociatedObject(self, NameKey, name, OBJC_ASSOCIATION_COPY);
//}
//
//- (NSString *)name {
//    return objc_getAssociatedObject(self, NameKey);
//}


//static const void *NameKey = &NameKey;
//- (void)setName:(NSString *)name {
//    objc_setAssociatedObject(self, NameKey, name, OBJC_ASSOCIATION_COPY);
//}
//
//- (NSString *)name {
//    return objc_getAssociatedObject(self, NameKey);
//}


//static const char NameKey;
//- (void)setName:(NSString *)name {
//    objc_setAssociatedObject(self, &NameKey, name, OBJC_ASSOCIATION_COPY);
//}
//
//- (NSString *)name {
//    return objc_getAssociatedObject(self, &NameKey);
//}


@end
