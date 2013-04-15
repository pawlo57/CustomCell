#import "ViewController.h"
#import "PickupCell.h"

NSString *const CELL_IDENTIFIER = @"Cell";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //support for ios 6.0
    if([self.tableView respondsToSelector:@selector(registerClass:forCellReuseIdentifier:)]){
        [self.tableView registerClass:[PickupCell class] forCellReuseIdentifier:CELL_IDENTIFIER];
    }
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table View DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 160;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PickupCell *cell = (PickupCell*)[tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    
    if(cell == nil){
        cell = [[PickupCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_IDENTIFIER];
    }
    
    return cell;
}

#pragma mark Table View Delegate

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //OddCell *cell = (OddCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    //cell.color = [UIColor redColor];
    
}

@end
