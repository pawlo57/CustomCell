#import <Foundation/Foundation.h>

@interface PickupImage : NSObject

@property (strong, nonatomic) UIImage *image;
@property (nonatomic) CGRect imageFrame;

- (id)initWithImage:(UIImage*)image frame:(CGRect)frame;

@end
