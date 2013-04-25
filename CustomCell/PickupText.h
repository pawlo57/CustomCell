#import <Foundation/Foundation.h>

@interface PickupText : NSObject

@property (strong,nonatomic) NSString *text;
@property (strong, nonatomic) UIFont *font;
@property (nonatomic) CGRect textRect;
@property (nonatomic) NSTextAlignment textAligment;
@property (nonatomic) NSLineBreakMode lineBreakMode;

- (id)initWithText:(NSString*)text font:(UIFont*)font rect:(CGRect)rect textAligment:(NSTextAlignment)textAligment lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end
