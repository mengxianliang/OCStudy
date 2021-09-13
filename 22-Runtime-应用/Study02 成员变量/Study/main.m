//
//  main.m
//  Study
//
//  Created by mxl on 2021/8/9.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"
#import <objc/runtime.h>


void run(id self, SEL _cmd) {
    NSLog(@"%@ %@", self, NSStringFromSelector(_cmd));
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 获取成员变量信息
        Ivar nameIvar = class_getInstanceVariable([Person class], "_name");
        // 获取成员变量的name和类型编码
        NSLog(@"%s %s",ivar_getName(nameIvar), ivar_getTypeEncoding(nameIvar));
        
        Person *person = [[Person alloc] init];
        // 设置成员变量的值
        object_setIvar(person, nameIvar, @"Jack");
        
        NSLog(@"person.name = %@", person.name);
        
        
        // 读取所有成员变量
        unsigned int count;
        Ivar *ivars = class_copyIvarList([Person class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            NSLog(@"%s %s",ivar_getName(ivar), ivar_getTypeEncoding(ivar));
        }
        // runtime里调用copy方法，需要手动销毁
        free(ivars);
        
    }
    return 0;
}


// 实例对象API
void instanceMethod(void) {
    
}

// 类相关API
void classMethod(void) {
    /**

     创建类需要在调用objc_registerClassPair添加成员变量，成员变量信息保存在类对象的class_ro_t中，是只读的。
     方法可以不用在调用objc_registerClassPair前添加，因为后添加的方法会保存到class_rw_t的methods中，是可读可写的。
     但是最好还是一起在注册类之前添加。
     */
    
    
    // 创建一个新的类
    Class dogClass = objc_allocateClassPair([NSObject class], "Dog", 0);
    // 添加一个成员变量
    class_addIvar(dogClass, "_age", 4, 1, @encode(int));
    
    
    // 添加一个方法
    class_addMethod(dogClass, @selector(run), (IMP)run, "V@:");
    
    
    // 创建后需要注册这个类
    objc_registerClassPair(dogClass);
    
    
    // 创建dog的实例对象
    id dog = [[dogClass alloc] init];
    
    
    // 设置属性的值
    [dog setValue:@10 forKey:@"_age"];
    
    // 调用添加后的方法
    [dog performSelector:@selector(run)];
    
    NSLog(@"dog = %@, size = %zd",dog, class_getInstanceSize(dogClass));
    
    NSLog(@"dog.age = %d",[[dog valueForKey:@"_age"] intValue]);
}

// 测试方法
void test(void) {
    
    Person *person = [[Person alloc] init];
    [person run];
    
    // 修改person的类型，修改isa的指向
    object_setClass(person, [Car class]);
    [person run];
    
    // 判断是否是类对象
    NSLog(@"%d,%d,%d", object_isClass(person), object_isClass(object_getClass(person)), object_isClass(object_getClass([Person class])));
}
