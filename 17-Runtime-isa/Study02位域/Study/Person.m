//
//  Person.m
//  Study
//
//  Created by 孟宪亮 on 2021/8/21.
//

#import "Person.h"



@interface Person()
{
    struct {
        char tall : 1;
        char rich : 1;
        char handsome : 1;
    } _tallRichHandsome;
}

@end

@implementation Person

- (void)setTall:(BOOL)tall {
    _tallRichHandsome.tall = tall;
}

- (void)setRich:(BOOL)rich {
    _tallRichHandsome.rich = rich;
}

- (void)setHandsome:(BOOL)handsome {
    _tallRichHandsome.handsome = handsome;
}

- (BOOL)tall {
    return _tallRichHandsome.tall;
}

- (BOOL)rich {
    return _tallRichHandsome.rich;
}

- (BOOL)handsome {
    return _tallRichHandsome.handsome;
}

@end
