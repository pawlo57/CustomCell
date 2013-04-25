#import "PickupRow.h"
#import "GDraw.h"
#import "PickupImage.h"
#import "PickupText.h"
#import "PickupCell.h"

@interface PickupRow ()

@property (weak, nonatomic) GDraw *gDraw;
@property (weak, nonatomic) PickupCell *delegate;

@property (strong, nonatomic) NSMutableArray *images;
@property (strong, nonatomic) NSMutableArray *texts;

@end

@implementation PickupRow

- (id)initWithHeight:(CGFloat)height rowIndex:(int)index Frame:(CGRect)frame lineWidth:(CGFloat)lineWidth images:(NSMutableArray*)images texts:(NSMutableArray*)texts {
    self = [super init];
    
    if(self){
        self.lineWidth = lineWidth;
        self.index = index;
        self.frame = CGRectMake(frame.origin.x, frame.origin.y + (index * height), frame.size.width, height);
        self.images = images;
        self.texts = texts;
    }
    return self;
}

- (BOOL)canDrawBottomLine {
    return (self.delegate.height - self.delegate.margin > self.frame.origin.y + self.frame.size.height);
}

- (void)drawContent {
    [self drawText:CGPointMake(self.frame.origin.x + 25.0f, self.frame.origin.y + (self.frame.size.height / 2) - 7.0f) text:@"Test"];
    [self drawLines];
    [self drawImages];
    [self drawTexts];
    NSLog(@"Row frame: %f, %f ,%f, %f Index: %d", self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height, _index);
}

- (void)drawLines {
    if([self canDrawBottomLine]){
        [self.gDraw drawLine:CGPointMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height) endPoint:CGPointMake(self.frame.size.width, self.frame.origin.y + self.frame.size.height) lineWidth:_lineWidth];
    }
}

- (void)drawImages {
    for(PickupImage *image in self.images){
        [self.gDraw drawImage:image.image inRect:CGRectMake(self.frame.origin.x + image.imageFrame.origin.x, self.frame.origin.y + image.imageFrame.origin.y, image.imageFrame.size.width, image.imageFrame.size.height)];
    }
}

- (void)drawTexts {
    for(PickupText *textToDraw in self.texts){
        CGRect textRect = CGRectMake(self.frame.origin.x + textToDraw.textRect.origin.x, self.frame.origin.y + textToDraw.textRect.origin.y, textToDraw.textRect.size.width, textToDraw.textRect.size.height);
        [textToDraw.text drawInRect: textRect withFont:textToDraw.font lineBreakMode:textToDraw.lineBreakMode alignment:textToDraw.textAligment];
        
        if(self.delegate.isDebugMode){
            [self drawDebugRect:textRect];
        }
    }
}

- (void)drawDebugRect:(CGRect)rect {
    [self.gDraw drawRect:rect withColor:[UIColor redColor]];
}

- (void)drawText:(CGPoint)location text:(NSString*)text {
}

- (void)addImage:(UIImage*)image withFrame:(CGRect)frame imageName:(NSString*)imageName {
    if(image != nil && !CGRectIsNull(frame)){
        [self.images addObject:image];
    }
}







@end
