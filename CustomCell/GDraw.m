#import "GDraw.h"

@implementation GDraw

#pragma mark Draw Round Rectangle

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

#pragma mark Draw Line

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

#pragma mark Draw Image

- (void)drawImage:(UIImage*)image inRect:(CGRect)imageRect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    CGContextDrawImage(context, imageRect, image.CGImage);
    CGContextRestoreGState(context);
}

#pragma mark Draw Rectangle

- (void)drawRect:(CGRect)rect withColor:(UIColor*)color {
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddRect(path, NULL, rect);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextAddPath(context, path);
    [color setStroke];
    CGContextSetLineWidth(context, 0.5f);
    
    CGContextDrawPath(context, kCGPathStroke);
 
    CGContextRestoreGState(context);
    
    CGPathRelease(path);
 }

#pragma mark Draw Text

- (void)drawText:(NSString*)text atPoint:(CGPoint)point {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    const char *charText = [text cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    CGContextSaveGState(context);
    CGContextSelectFont(context, "Courier", 14.0f, kCGEncodingMacRoman);
    CGContextSetFillColor(context, CGColorGetComponents([UIColor redColor].CGColor));
    CGContextShowTextAtPoint(context, point.x, point.y, charText, strlen(charText));
    CGContextRestoreGState(context);
}


@end
