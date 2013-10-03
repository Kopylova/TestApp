//
//  ShotsViewController.m
//  test
//
//  Created by admin on 03.10.13.
//  Copyright (c) 2013 TestAppBundle. All rights reserved.
//

#import "ShotsViewController.h"
#import "CustomeCell.h"
#import "DataSource.h"
#import "ImageHelper.h"
#import "Constants.h"

@interface ShotsViewController ()
@property (strong, nonatomic) NSMutableArray *formItems;
@end

@implementation ShotsViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerNib:[UINib nibWithNibName:@"CustomeCell"
        bundle:nil]
        forCellReuseIdentifier:@"Cell"];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    DataSource *dataSource = [DataSource instance];
    return [dataSource countOfShots];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataSource *dataSource = [DataSource instance];


    static NSString *cellIdentifier = @"CustomeCell";
    CustomeCell *cell = (CustomeCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
     if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomeCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    // If there is no cell to reuse, create a new one
   /* if(cell == nil)
    {
        cell = [[CustomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }*/
    
    // Configure the cell before it is displayed...
    
    cell.label1.text =[[dataSource getAllShotNames]objectAtIndex:indexPath.row];
    
    ImageHelper *imageHelper = [ImageHelper instance];
    
    UIImage *origanalImage = [UIImage imageNamed:[[dataSource getAllShotImages] objectAtIndex:indexPath.row]];
    
    CGRect imageRect = CGRectMake(0, 0, SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT);
    
    cell.thumbnailImageView.image =[imageHelper resizedImage:origanalImage inRect:imageRect : [[NSString alloc] initWithFormat:@"1%d",(int)indexPath.row ]];
    
    [origanalImage release];
    
    
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myButton.frame = CGRectMake(250, 10, 18, 18);
    [myButton addTarget:self action:@selector(accessoryButtonTapped:event:)  forControlEvents:UIControlEventTouchUpInside];
    
    id val = [dataSource getIsFavoriteItem:(int)indexPath.row];
    if([val isEqual:@0])
    {
        [myButton setImage:[UIImage imageNamed:@"starGrey.png"] forState:UIControlStateNormal];
    }
    else
    {
        [myButton setImage:[UIImage imageNamed:@"starRed.png"] forState:UIControlStateNormal];
    }
   
    [cell.contentView addSubview:myButton];
    
    return cell;
}

- (void)accessoryButtonTapped:(id)sender event:(id)event
{
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint: currentTouchPosition];
    if (indexPath != nil)
    {
        DataSource *dataSource = [DataSource instance];
        id val = [dataSource getIsFavoriteItem:(int)indexPath.row];
        if([val isEqual:@0])
        {
            [dataSource setIsFavoriteItem:(int)indexPath.row over:@1];
        }
        
        else
        {
            [dataSource setIsFavoriteItem:(int)indexPath.row over:@0];
        }
                
        [self.tableView reloadData];
        
    }
    
    
}

- (void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{  
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
