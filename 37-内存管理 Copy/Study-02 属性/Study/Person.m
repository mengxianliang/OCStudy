//
//  Person.m
//  Study
//
//  Created by mxl on 2021/9/9.
//

#import "Person.h"

@implementation Person

- (void)setData:(NSArray *)data {
    if (_data != data) {
        [_data release];
        _data = [data copy];
    }
}

- (void)dealloc {
    self.data = nil;
    
    [super dealloc];
}

@end
