//
//  NewTableViewController.m
//  tabeg
//
//  Created by Tummala, Keerthana on 11/3/14.
//  Copyright (c) 2014 Tummala, Keerthana. All rights reserved.
//

#import "NewTableViewController.h"
#import "Dispaly.h"

@interface NewTableViewController ()

@end

@implementation NewTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:1];
        
        
        
    }
    return self;
}


 //self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:3];

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Categories"];
   // self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"3.png"]];
    self.parentViewController.view.backgroundColor = [UIColor
                                                      colorWithPatternImage:[UIImage imageNamed:@"3.png"]];
    //self.parentViewController.view.alpha = 1.00;
    
    //--- set the tableview background as clear to view the backsplash
    self.view.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"3.png"]];
    //self.view.separatorColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"3.png"]];
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor]; //must do here in willDisplayCell
    cell.textLabel.backgroundColor =[UIColor clearColor]; //must do here in willDisplayCell
    cell.textLabel.textColor = [UIColor blackColor]; //can do here OR in cellForRowAtIndexPath
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
 if (cell == nil) {
 cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
 }
 if(indexPath.row == 0)    {
 cell.textLabel.text = @"SNACKS";
 }
 else if(indexPath.row == 1)    {
 cell.textLabel.text = @"BEVERAGES";
 }
 else if(indexPath.row == 2)    {
 cell.textLabel.text = @"SALADS";
 }
 else if(indexPath.row == 3)    {
     cell.textLabel.text = @"LUNCH";
 }
 else if(indexPath.row == 4)    {
     cell.textLabel.text = @"DINNER";
 }
 else if(indexPath.row == 5)    {
     cell.textLabel.text = @"BREAKFAST";
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
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* selectedCategory;
    if(indexPath.row == 0)    {
        selectedCategory = @"SNACKS";
        Dispaly *displayView0 = [[Dispaly alloc]
                                      initWithNibName:@"Dispaly"
                                      bundle:nil];
        displayView0.cate= @"SNACKS";
        [[self navigationController] pushViewController:displayView0 animated:YES];
        [displayView0 release];
        
    }
    if(indexPath.row == 1)    {
        selectedCategory = @"BEVARAGES";
        Dispaly *displayView1 = [[Dispaly alloc]
                                          initWithNibName:@"Dispaly"
                                          bundle:nil];
        displayView1.cate= @"BEVARAGES";
        [[self navigationController] pushViewController:displayView1 animated:YES];
        [displayView1 release];
        
    }
    if(indexPath.row == 2)    {
        selectedCategory = @"SALAD";
        Dispaly *displayView2 = [[Dispaly alloc]
                                          initWithNibName:@"Dispaly"
                                          bundle:nil];
        displayView2.cate= @"SALAD";
        [[self navigationController] pushViewController:displayView2 animated:YES];
        [displayView2 release];
        
    }
    if(indexPath.row == 3)    {
        selectedCategory = @"LUNCH";
        Dispaly *displayView3 = [[Dispaly alloc]
                                          initWithNibName:@"Dispaly"
                                          bundle:nil];
        displayView3.cate= @"LUNCH";
        [[self navigationController] pushViewController:displayView3 animated:YES];
        [displayView3 release];
        
    }
    if(indexPath.row == 4)    {
        selectedCategory = @"DINNER";
        Dispaly *displayView4 = [[Dispaly alloc]
                                          initWithNibName:@"Dispaly"
                                          bundle:nil];
        displayView4.cate= @"DINNER";
        [[self navigationController] pushViewController:displayView4 animated:YES];
        [displayView4 release];
        
    }
    if(indexPath.row == 5)    {
        selectedCategory = @"BREAKFAST";
        Dispaly *displayView5 = [[Dispaly alloc]
                                          initWithNibName:@"Dispaly"
                                          bundle:nil];
        displayView5.cate= @"BREAKFAST";
        [[self navigationController] pushViewController:displayView5 animated:YES];
        [displayView5 release];
        
    }
   
    
    
    
}


/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

@end
