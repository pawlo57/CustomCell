#import "PickupImage.h"

@implementation PickupImage

- (id)initWithImage:(UIImage *)image imageName:(NSString *)imageName frame:(CGRect)frame {
    if(self == [super init]){
        self.image = image;
        self.imageName = imageName;
        self.imageFrame = frame;
    }
    return  self;
}

@end
