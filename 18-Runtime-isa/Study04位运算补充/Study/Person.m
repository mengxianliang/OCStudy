//
//  Person.m
//  Study
//
//  Created by 孟宪亮 on 2021/8/21.
//

#import "Person.h"

typedef enum {
    OptionsOne = 1<<0,
    OptionsTwo = 1<<1,
    OptionsThree = 1<<2
} Options;


@implementation Person

- (instancetype)init {
    if (self = [super init]) {
        
        [self setOpitions:OptionsOne | OptionsTwo | OptionsThree];
        
        NSKeyValueObservingOptions
        self addObserver:<#(nonnull NSObject *)#> forKeyPath:<#(nonnull NSString *)#> options:(NSKeyValueObservingOptions) context:<#(nullable void *)#>
        
    }
    return self;
}

- (void)setOpitions:(Options)options {
    if (OptionsOne & options) {
        // 包含OptionsOne
    }
    
    if (OptionsTwo & options) {
        // 包含OptionsTwo
    }
    
    if (OptionsThree & options) {
        // 包含OptionsThree
    }
}


@end
