//
//  Person.m
//  Study
//
//  Created by 孟宪亮 on 2021/8/21.
//

#import "Person.h"

#define TallMask (1<<0) // 1向(左移动动0位(0b 0000 0001)
#define RichMask (1<<1) // 1向左移动动1位(0b 0000 0010)
#define HandsomeMask (1<<2) // 1向左移动动2位(0b 0000 0100)

@interface Person()
{
    union {
        char bits;
        struct {
            char tall : 1;
            char rich : 1;
            char handsome : 1;
        };
    } _tallRichHandsome;
}

@end

@implementation Person

- (void)setTall:(BOOL)tall {
    if (tall) {
        _tallRichHandsome.bits |= TallMask;
    }else {
        _tallRichHandsome.bits &= ~TallMask;
    }
}

- (void)setRich:(BOOL)rich {
    if (rich) {
        _tallRichHandsome.bits |= RichMask;
    }else {
        _tallRichHandsome.bits &= ~RichMask;
    }
}



- (void)setHandsome:(BOOL)handsome {
    if (handsome) {
        _tallRichHandsome.bits |= HandsomeMask;
    }else {
        _tallRichHandsome.bits &= ~HandsomeMask;
    }
}


- (BOOL)handsome {
    return !!(_tallRichHandsome.bits & 4);//0b00000100
}

- (BOOL)tall {
    return !!(_tallRichHandsome.bits & 1);// 0b00000001
}

- (BOOL)rich {
    return !!(_tallRichHandsome.bits & 2);// 0b00000010
}


@end
