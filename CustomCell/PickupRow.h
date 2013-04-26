#import <Foundation/Foundation.h>

@interface PickupRow : NSObject

@property (nonatomic) int index;
@property (nonatomic) CGRect frame;
@property (nonatomic) CGFloat lineWidth;
@property (weak, nonatomic) UIColor *color;

- (void)drawContent;

- (id)initWithHeight:(CGFloat)height rowIndex:(int)index Frame:(CGRect)frame lineWidth:(CGFloat)lineWidth images:(NSArray*)images texts:(NSArray*)texts;

@end
