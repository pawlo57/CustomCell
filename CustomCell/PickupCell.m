#import "PickupCell.h"
#import "PickupRow.h"
#import "GDraw.h"

CGFloat const CELL_MARGIN = 10.0f;
CGFloat const CELL_CORNER_RADIUS = 5.0f;
CGFloat const CELL_LINE_WIDTH_DEFAULT = 0.2f;
CGFloat const CELL_LINE_WIDTH_SELECTED = 1.0f;

@interface PickupCell ()

@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat margin;
@property (nonatomic) CGFloat cornerRadius;
@property (strong, nonatomic) NSMutableArray *rows;
@property (strong, nonatomic) UIColor *color;

@property (strong, nonatomic) GDraw *gDraw;

@end

@implementation PickupCell

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
    _margin = 10.0f;
    _cornerRadius = 5.0f;
    _rows = [[NSMutableArray alloc] init];
    _gDraw = [[GDraw alloc] init];
    
    [self addRowWithRowHeight:55.0f];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [self drawContent];

    [self drawRows];
}

- (void)drawRows {
    for(PickupRow *row in _rows){
        [row setColor:_color];
        [row setLineWidth:_lineWidth];
        [row drawContent];
    }
}

- (void)setupRowsLineWidth:(CGFloat)width {
    for (PickupRow *row in _rows){
        row.lineWidth = width;
    };
}

- (void)drawContent {
    [self.gDraw drawRoundRectWithColor:_color margin:CELL_MARGIN cornerRadius:CELL_CORNER_RADIUS lineWidth:_lineWidth frame:self.bounds isFill:NO];
    //[self drawLine:CGPointMake(self.bounds.origin.x + 10.0f, self.bounds.origin.y + 55.0f) endPoint:CGPointMake(self.bounds.size.width - 10.0f, self.bounds.origin.y + 55.0f)];
    //[self drawLine:CGPointMake(self.bounds.origin.x + 10.0f, self.bounds.origin.y + 105.0f) endPoint:CGPointMake(self.bounds.size.width - 10.0f, self.bounds.origin.y + 105.0f)];
    
    //[self drawText:CGPointMake(self.bounds.origin.x + 25.0f, self.bounds.origin.y + 23.0f) text:@"Table view cell"];
    
    // [self drawImage:CGPointMake(self.bounds.size.width - 60.0f, self.bounds.origin.y + 12.0f) image:[UIImage imageNamed:@"xcode.png"]];
}

- (CGRect)cellBoundsWithMargin:(CGFloat)margin {
    return CGRectMake(self.bounds.origin.x + margin, self.bounds.origin.y + margin, self.bounds.size.width - margin, self.bounds.size.height - margin);
}

- (void)addRowWithRowHeight:(int)height {
    PickupRow *row = [[PickupRow alloc] initWithHeight:height rowIndex:0 Frame:[self cellBoundsWithMargin:_margin] lineWidth:_lineWidth];
    [row setValue:self.gDraw forKey:@"gDraw"];
    
    [_rows addObject:row];
}

- (void)drawText:(CGPoint)location text:(NSString*)text {
    [text drawAtPoint:location withFont:[UIFont fontWithName:@"Futura" size:14.0f]];
}

- (void)drawImage: (CGPoint)location image: (UIImage*)image {
    [image drawInRect:CGRectMake(location.x, location.y, 40.0f, 40.0f)];
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
    _color = [UIColor redColor];
    _lineWidth = 1.0f;
    
    [self setNeedsDisplayInRect:self.bounds];
}

@end
