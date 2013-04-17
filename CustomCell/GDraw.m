//
//  GDraw.m
//  CustomCell
//
//  Created by Paweł Czechowski on 16.04.2013.
//  Copyright (c) 2013 Pawel. All rights reserved.
//

#import "GDraw.h"

@implementation GDraw

- (void)drawRoundRectWithColor: (UIColor*)color margin:(CGFloat)margin cornerRadius:(CGFloat)cornerRadius lineWidth:(CGFloat)lineWidth frame:(CGRect)frame isFill:(BOOL)isFill {
    UIBezierPath *path =
    [UIBezierPath bezierPathWithRoundedRect:CGRectMake(margin, margin, frame.size.width - 2 * margin, frame.size.height - 2 * margin) cornerRadius:cornerRadius];
    [path setLineWidth:lineWidth];
    
    if(isFill){
        [color setFill];
        [path fill];
        
    }
    else {
        [color setStroke];
        [path stroke];
    }
}

- (void)drawLine: (CGPoint)startPoint endPoint:(CGPoint)endPoint lineWidth:(CGFloat)lineWidth {
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, startPoint.x,startPoint.y);
    CGPathAddLineToPoint(path, NULL, endPoint.x, endPoint.y);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextAddPath(context, path);
    
    CGContextSetLineWidth(context, lineWidth);
    
    CGContextDrawPath(context,kCGPathStroke);
    
    CGContextRestoreGState(context);
    
    CGPathRelease(path);
}


@end
