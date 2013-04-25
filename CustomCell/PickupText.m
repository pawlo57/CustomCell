#import "PickupText.h"

@implementation PickupText

- (id)initWithText:(NSString*)text font:(UIFont*)font rect:(CGRect)rect textAligment:(NSTextAlignment)textAligment lineBreakMode:(NSLineBreakMode)lineBreakMode {
    if((self = [super init])){
        self.text = text;
        self.font = font;
        self.textRect = rect;
        self.textAligment = textAligment;
        self.lineBreakMode = lineBreakMode;
    }
    return self;
}

@end
