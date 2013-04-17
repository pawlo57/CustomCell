//
//  PickupRow.m
//  CustomCell
//
//  Created by Paweł Czechowski on 15.04.2013.
//  Copyright (c) 2013 Pawel. All rights reserved.
//

#import "PickupRow.h"
#import "GDraw.h"

@interface PickupRow ()

@property (weak, nonatomic) GDraw *gDraw;

@property (strong, nonatomic) NSMutableArray *images;
@property (strong, nonatomic) NSMutableArray *texts;

@end

@implementation PickupRow

- (id)initWithHeight:(CGFloat)height rowIndex:(int)index Frame:(CGRect)frame lineWidth:(CGFloat)lineWidth {
    self = [super init];
    
    if(self){
        self.lineWidth = lineWidth;
        self.index = index;
        self.frame = CGRectMake(frame.origin.x, frame.origin.y + (index * height), frame.size.width, height);
        self.images = [[NSMutableArray alloc] init];
        self.texts = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)drawContent {
    [self drawText:CGPointMake(self.frame.origin.x + 25.0f, self.frame.size.height / 2) text:@"Test"];
    [self.gDraw drawLine:CGPointMake(self.frame.origin.x, self.frame.size.height) endPoint:CGPointMake(self.frame.size.width, self.frame.size.height) lineWidth:_lineWidth];
    NSLog(@"Row frame: %f, %f ,%f, %f", self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height);
}

- (void)drawImages {
    for(UIImage *image in self.images){
        
    }
}

- (void)drawText:(CGPoint)location text:(NSString*)text {
    [text drawAtPoint:location withFont:[UIFont fontWithName:@"Futura" size:14.0f]];
}

- (void)addImage:(UIImage*)image {
    if(image != nil){
        [self.images addObject:image];
    }
}







@end
