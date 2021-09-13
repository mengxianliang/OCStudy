//
//  Dog.m
//  Study
//
//  Created by mxl on 2021/9/8.
//

#import "Dog.h"

@implementation Dog

- (void)run {
    NSLog(@"%s",__func__);
}

- (void)dealloc {
    [super dealloc];
    NSLog(@"%s",__func__);
}

@end
