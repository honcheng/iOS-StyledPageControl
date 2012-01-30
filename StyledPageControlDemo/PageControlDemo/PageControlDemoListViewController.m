//
//  PageControlDemoListViewController.m
//  PageControlDemo
//
//  Created by honcheng on 5/14/11.
//  Copyright 2011 BuUuK Pte Ltd. All rights reserved.
//

#import "PageControlDemoListViewController.h"
#import "PageControlDemoTableViewCell.h"

@implementation PageControlDemoListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        [self setTitle:@"PageControl Demo"];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 3;
    }
    else if (section==1)
    {
        return 1;
    }
    else if (section==2)
    {
        return 1;
    }
    else if (section==3)
    {
        return 1;
    }
    else if (section==4)
    {
        return 1;
    }
    else if (section==5)
    {
        return 1;
    }
    else return 0;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return @"PageControlStyleDefault";
    }
    else if (section==1)
    {
        return @"PageControlStyleStrokedCircle";
    }
    else if (section==2)
    {
        return @"PageControlStylePressed1";
    }
    else if (section==3)
    {
        return @"PageControlStylePressed2";
    }
    else if (section==4)
    {
        return @"PageControlStyleWithPageNumber";
    }
    else if (section==5)
    {
        return @"PageControlStyleThumb";
    }
    else return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 34;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    PageControlDemoTableViewCell *cell = (PageControlDemoTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = [[[PageControlDemoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    [cell.pageControl setNumberOfPages:10];
    [cell.pageControl setCurrentPage:5];

    if (indexPath.section==0)
    {
        [cell.pageControl setPageControlStyle:PageControlStyleDefault]; 
        if (indexPath.row==0)
        {
            // default style without changes
        }
        else if (indexPath.row==1)
        {
            // change color
            [cell.pageControl setCoreNormalColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1]];
            [cell.pageControl setCoreSelectedColor:[UIColor colorWithRed:0.8 green:0.2 blue:0.2 alpha:1]];
        }
        else if (indexPath.row==2)
        {
            // change gap width
            [cell.pageControl setGapWidth:5];
            // change diameter
            [cell.pageControl setDiameter:9];
        }
    }
    else if (indexPath.section==1)
    {
        [cell.pageControl setPageControlStyle:PageControlStyleStrokedCircle];
    }
    else if (indexPath.section==2)
    {
        [cell.pageControl setPageControlStyle:PageControlStylePressed1];
        [cell.pageControl setBackgroundColor:[UIColor darkGrayColor]];
    }
    else if (indexPath.section==3)
    {
        [cell.pageControl setPageControlStyle:PageControlStylePressed2];
        [cell.pageControl setBackgroundColor:[UIColor darkGrayColor]];
    }
    else if (indexPath.section==4)
    {
        [cell.pageControl setPageControlStyle:PageControlStyleWithPageNumber];
        [cell.pageControl setNumberOfPages:14];
    }
    else if (indexPath.section==5)
    {
        [cell.pageControl setPageControlStyle:PageControlStyleThumb];
        [cell.pageControl setThumbImage:[UIImage imageNamed:@"pagecontrol-thumb-normal.png"]];
        [cell.pageControl setSelectedThumbImage:[UIImage imageNamed:@"pagecontrol-thumb-selected.png"]];
        [cell.pageControl setNumberOfPages:10];
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
