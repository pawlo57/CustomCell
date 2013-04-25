#import <Foundation/Foundation.h>

@interface PickupRow : NSObject

@property (nonatomic) int index;
@property (nonatomic) CGRect frame;
@property (nonatomic) CGFloat lineWidth;
@property (weak, nonatomic) UIColor *color;

- (void)drawContent;

- (id)initWithHeight:(CGFloat)height rowIndex:(int)index Frame:(CGRect)frame lineWidth:(CGFloat)lineWidth images:(NSMutableArray*)images texts:(NSMutableArray*)texts;

- (void)addImage:(UIImage*)image withFrame:(CGRect)frame imageName:(NSString*)imageName;

@end
