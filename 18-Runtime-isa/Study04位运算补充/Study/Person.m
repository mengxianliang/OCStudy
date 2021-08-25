//
//  Person.m
//  Study
//
//  Created by 孟宪亮 on 2021/8/21.
//

#import "Person.h"

//#define TallMask 1
//#define RichMask 2
//#define HandsomeMask 4

//#define TallMask 0b00000001
//#define RichMask 0b00000010
//#define HandsomeMask 0b00000100

#define TallMask (1<<0) // 1向(左移动动0位(0b 0000 0001)
#define RichMask (1<<1) // 1向左移动动1位(0b 0000 0010)
#define HandsomeMask (1<<2) // 1向左移动动2位(0b 0000 0100)

@interface Person()
{
    char _tallRichHandsome;// 0b 0000 0001
}

@end

@implementation Person

- (instancetype)init {
    if (self = [super init]) {
        _tallRichHandsome = 0b00000110;
    }
    return self;
}

- (void)setTall:(BOOL)tall {
    if (tall) {
        _tallRichHandsome |= TallMask;
    }else {
        _tallRichHandsome &= ~TallMask;
    }
}

- (void)setRich:(BOOL)rich {
    if (rich) {
        _tallRichHandsome |= RichMask;
    }else {
        _tallRichHandsome &= ~RichMask;
    }
}

- (void)setHandsome:(BOOL)handsome {
    if (handsome) {
        _tallRichHandsome |= HandsomeMask;
    }else {
        _tallRichHandsome &= ~HandsomeMask;
    }
}

- (BOOL)tall {
    return !!(_tallRichHandsome & 1);// 0b00000001
}

- (BOOL)rich {
    return !!(_tallRichHandsome & 2);// 0b00000010
}

- (BOOL)handsome {
    return !!(_tallRichHandsome & 4);//0b00000100
}

@end
