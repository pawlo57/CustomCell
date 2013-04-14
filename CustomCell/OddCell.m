#import "OddCell.h"


@interface OddCell ()

@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat margin;
@property (strong, nonatomic) NSMutableArray *rows;
@property (strong, nonatomic) UIColor *color;

@end

@implementation OddCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCell];
    }
    return self;
}

- (void)setupCell {
    _lineWidth = 0.2f;
    _color = [UIColor blackColor];
    _height = 160;
    _margin = 5.0f;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [self drawRoundRectWithColor:_color];
    [self drawLine:CGPointMake(self.bounds.origin.x + 10.0f, self.bounds.origin.y + 55.0f) endPoint:CGPointMake(self.bounds.size.width - 10.0f, self.bounds.origin.y + 55.0f)];
        [self drawLine:CGPointMake(self.bounds.origin.x + 10.0f, self.bounds.origin.y + 105.0f) endPoint:CGPointMake(self.bounds.size.width - 10.0f, self.bounds.origin.y + 105.0f)];
    
    [self drawText:CGPointMake(self.bounds.origin.x + 25.0f, self.bounds.origin.y + 23.0f) text:@"Table view cell"];
    
    [self drawImage:CGPointMake(self.bounds.size.width - 60.0f, self.bounds.origin.y + 12.0f) image:[UIImage imageNamed:@"xcode.png"]];
    
}

- (void)addRowWithRowHeight:(int)height {
    
}

- (void)drawText:(CGPoint)location text:(NSString*)text {
    [text drawAtPoint:location withFont:[UIFont fontWithName:@"Futura" size:14.0f]];
}

- (void)drawImage: (CGPoint)location image: (UIImage*)image {
    [image drawInRect:CGRectMake(location.x, location.y, 40.0f, 40.0f)];
}


- (void)drawRoundRectWithColor: (UIColor*)color {
    UIBezierPath *path =
    [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10.0f, 10.0f, self.frame.size.width - 20.0f, self.frame.size.height - 20.0f) cornerRadius:5.0f];
    [color setStroke];
    
    [path setLineWidth:_lineWidth];
    
    [path stroke];
    
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

- (void)drawRect {
    [[UIColor brownColor] set];
    
    //get current graphics context
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    
    //set line join
    CGContextSetLineJoin(currentContext, kCGLineJoinRound);
    
    //set line width
    CGContextSetLineWidth(currentContext, 0.5f);
    
    //starting point
    CGContextMoveToPoint(currentContext, self.frame.origin.x + 5.0f, self.frame.origin.y + 5.0f);
    
    //add the end point
    CGContextAddLineToPoint(currentContext, self.frame.size.width - 5.0f, self.frame.origin.y + 5.0f);
    
    //add another point
    CGContextAddLineToPoint(currentContext, self.frame.size.width - 5.0f ,self.frame.size.height - 5.0f);
    
    //draw line
    CGContextStrokePath(currentContext);
    
    CGContextRestoreGState(currentContext);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if(!selected){
        _color = [UIColor blackColor];
        
        [self setNeedsDisplayInRect:self.bounds];
        _lineWidth = 0.2f;
        
        return;
    }
    //[super setSelected:selected animated:animated];
    
    _color = [UIColor redColor];
    _lineWidth = 1.0f;
    
    [self setNeedsDisplayInRect:self.bounds];
}

@end
