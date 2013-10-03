//
//  FavoriteViewController.m
//  TestApp
//
//  Created by admin on 04.10.13.
//  Copyright (c) 2013 TestAppBundle. All rights reserved.
//

#import "FavoriteViewController.h"
#import "DataSource.h"
#import "ImageHelper.h"
#import "Constants.h"

@interface FavoriteViewController ()

@end

@implementation FavoriteViewController

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated {
    
   // [super viewWillAppear:animated];
    
    //[self.tabBarController viewWillAppear:animated];
    
    [self.tableView reloadData];
    
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
    if([dataSource countOfFavoriteShots]==0)
        return 1;
    else
        return [dataSource countOfFavoriteShots];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataSource *dataSource = [DataSource instance];
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ([dataSource countOfFavoriteShots]>0)
    {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    int index = 0;
    int countFavoriteShots = 0;
    for(int i=0; i<[dataSource countOfShots]; i++)
    {
        id val = [dataSource getIsFavoriteItem:i];
        if(![val isEqual:@0])
        {
            countFavoriteShots++;
            if(indexPath.row+1==countFavoriteShots)
            {
                index = i;
                break;
            }
         }
     }
            
    cell.textLabel.text=[[dataSource getAllShotNames]objectAtIndex:index];
        
    UIImage *origanalImage = [UIImage imageNamed:[[dataSource getAllShotImages] objectAtIndex:index]];
        
        ImageHelper *imageHelper = [ImageHelper instance];
        
        
        CGRect imageRect = CGRectMake(0, 0, SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT);
        
        
        cell.imageView.image =[imageHelper resizedImage:origanalImage inRect:imageRect : [[NSString alloc] initWithFormat:@"1%d", index]];
        
        [origanalImage release];
        
        
        
    }
    else
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.textLabel.text=@"No favorites shots";
        
    }
    
    return cell;
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
