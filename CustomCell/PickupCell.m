#import "PickupCell.h"
#import "PickupRow.h"
#import "PickupImage.h"
#import "PickupText.h"
#import "GDraw.h"

CGFloat const CELL_MARGIN = 10.0f;
CGFloat const CELL_CORNER_RADIUS = 5.0f;
CGFloat const CELL_LINE_WIDTH_DEFAULT = 0.2f;
CGFloat const CELL_LINE_WIDTH_SELECTED = 1.0f;

@interface PickupCell ()

@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) CGFloat cornerRadius;
@property (strong, nonatomic) NSMutableArray *rows;
@property (strong, nonatomic) UIColor *color;
@property (nonatomic) int currentRowIndex;

@property (strong, nonatomic) GDraw *gDraw;

@end

@implementation PickupCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCell];
        [self setupRows];
    }
    return self;
}

#pragma mark Setup Cell

- (void)setupCell {
    _isDebugMode = NO;
    _lineWidth = 0.2f;
    _color = [UIColor blackColor];
    _currentRowIndex = 0;
    _margin = CELL_MARGIN;
    _height = 2*CELL_MARGIN;
    _cornerRadius = 5.0f;
    _rows = [[NSMutableArray alloc] init];
    _gDraw = [[GDraw alloc] init];
}

- (void)setupRows {
    UIImage *destinationImage = [UIImage imageNamed:@"icon_destination_point.png"];
    
    PickupImage *testImage = [[PickupImage alloc] initWithImage:destinationImage frame:CGRectMake(55, 10,destinationImage.size.width, destinationImage.size.height)];
    NSArray *images = [[NSArray alloc] initWithObjects:testImage, nil];
    
    PickupText *pickupText = [[PickupText alloc] initWithText:@"Test uhuhuhuiuhuhuhuhuhuhuhuh kokojihu oooioji okokokoihi ojooihioo okokojij ojojojih oojiojij ijijijihu jijijij" font:[UIFont fontWithName:@"Futura" size:12.0f] rect:CGRectMake(150.0f, 5.0f, 120.0f, 40.0f) textAligment:NSTextAlignmentJustified lineBreakMode:NSLineBreakByCharWrapping];
    
    NSArray *texts = [[NSArray alloc] initWithObjects:pickupText, nil];
    
    [self addRowWithRowHeight:50.0f images:images texts:texts];
    [self addRowWithRowHeight:50.0f images:images texts:texts];
    [self addRowWithRowHeight:50.f images:images texts:texts];
}


#pragma mark Draw Rect

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [self drawContent];
    [self drawRows];
}

#pragma mark Draw Rows

- (void)drawRows {
    for(PickupRow *row in _rows){
        [row setColor:_color];
        [row setLineWidth:_lineWidth];
        [row drawContent];
    }
}

#pragma mark Draw Cell Content

//draw cell content like rounded frame (it's not draw rows)
- (void)drawContent {
    [self.gDraw drawRoundRectWithColor:_color margin:CELL_MARGIN cornerRadius:CELL_CORNER_RADIUS lineWidth:_lineWidth frame:self.bounds isFill:NO];
}

- (CGRect)cellBoundsWithMargin:(CGFloat)margin {
    return CGRectMake(self.bounds.origin.x + margin, self.bounds.origin.y + margin, self.bounds.size.width - margin, self.bounds.size.height - margin);
}

//setting row frame depending on row index
- (CGRect)rowFrameWithIndex:(int)index rowHeight:(int)rowHeight {
    CGRect cellBounds = [self cellBoundsWithMargin:_margin];
    return CGRectMake(cellBounds.origin.x, cellBounds.origin.y + (rowHeight * index), cellBounds.size.width, cellBounds.size.height);
}

#pragma mark Add Cell Row

- (void)addRowWithRowHeight:(int)height images:(NSArray*)pickupImages texts:(NSArray*)texts{
    PickupRow *row = [[PickupRow alloc] initWithHeight:height rowIndex:self.currentRowIndex Frame:[self cellBoundsWithMargin:_margin] lineWidth:_lineWidth images:pickupImages texts:texts];
    [row setValue:self.gDraw forKey:@"gDraw"];
    [row setValue:self forKey:@"delegate"];
    [_rows addObject:row];
    _height += height;
    _currentRowIndex++;
}

#pragma mark Cell Selection

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if(!selected){
        _color = [UIColor blackColor];
        
        [self setNeedsDisplayInRect:self.bounds];
        _lineWidth = CELL_LINE_WIDTH_DEFAULT;
        
        return;
    }
    _color = [UIColor redColor];
    _lineWidth = CELL_LINE_WIDTH_SELECTED;
    
    [self setNeedsDisplayInRect:self.bounds];
}

@end
