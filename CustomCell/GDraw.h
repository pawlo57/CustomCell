#import <Foundation/Foundation.h>

@interface GDraw : NSObject

- (void)drawRoundRectWithColor: (UIColor*)color margin:(CGFloat)margin cornerRadius:(CGFloat)cornerRadius lineWidth:(CGFloat)lineWidth frame:(CGRect)frame isFill:(BOOL)isFill;

- (void)drawLine: (CGPoint)startPoint endPoint:(CGPoint)endPoint lineWidth:(CGFloat)lineWidth;

- (void)drawImage:(UIImage*)image inRect:(CGRect)imageRect;

- (void)drawText:(NSString*)text atPoint:(CGPoint)point;

- (void)drawRect:(CGRect)rect withColor:(UIColor*)color;

@end
