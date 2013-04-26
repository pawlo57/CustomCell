#import "PickupImage.h"

@implementation PickupImage

- (id)initWithImage:(UIImage *)image frame:(CGRect)frame {
    if(self == [super init]){
        self.image = image;
        self.imageFrame = frame;
    }
    return  self;
}

@end
