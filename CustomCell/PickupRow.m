//
//  PickupRow.m
//  CustomCell
//
//  Created by Paweł Czechowski on 15.04.2013.
//  Copyright (c) 2013 Pawel. All rights reserved.
//

#import "PickupRow.h"

@interface PickupRow ()

@property (nonatomic) CGFloat lineWidth;

@end

@implementation PickupRow

- (id)initWithHeight:(CGFloat)height rowIndex:(int)index Frame:(CGRect)frame lineWidth:(CGFloat)width {
    self = [super init];
    
    if(self){
        self.lineWidth = width;
        self.index = index;
        self.frame = CGRectMake(frame.origin.x, frame.origin.y + (index * height), frame.size.width, height);
    }
    return self;
}

- (void)drawContent {
    [self drawText:CGPointMake(self.frame.origin.x + 25.0f, self.frame.size.height / 2) text:@"Test"];
    [self drawLine:CGPointMake(self.frame.origin.x, self.frame.size.height) endPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    NSLog(@"Row frame: %f, %f ,%f, %f", self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height);
}

- (void)drawText:(CGPoint)location text:(NSString*)text {
    [text drawAtPoint:location withFont:[UIFont fontWithName:@"Futura" size:14.0f]];
}

- (void)drawLine: (CGPoint)startPoint endPoint:(CGPoint)endPoint {
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, startPoint.x,startPoint.y);
    CGPathAddLineToPoint(path, NULL, endPoint.x, endPoint.y);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextAddPath(context, path);
    
    CGContextSetLineWidth(context, _lineWidth);
    
    CGContextDrawPath(context,kCGPathStroke);
    
    CGContextRestoreGState(context);
    
    CGPathRelease(path);
}

- (void)setSelected:(BOOL)selected {
    if(selected){
        _lineWidth = 1.0f;
    }
    else{
        _lineWidth = 0.2f;
    }
}






@end
