#import <Foundation/Foundation.h>

@interface PickupImage : NSObject

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *imageName;
@property (nonatomic) CGRect imageFrame;

- (id)initWithImage:(UIImage*)image imageName:(NSString*)imageName frame:(CGRect)frame;

@end
