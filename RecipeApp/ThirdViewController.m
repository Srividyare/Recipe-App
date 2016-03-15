//
//  ThirdViewController.m
//  tabeg
//
//  Created by Srividya Rentala on 11/2/14.
//  Copyright (c) 2014 Srividya Rentala. All rights reserved.
//

#import "ThirdViewController.h"
#import "AppDelegate.h"
#include "DetailRecipeViewController.h"
#import "recipeDatabase.h"


@interface ThirdViewController ()
{
    
    NSMutableArray *sections;
    NSManagedObjectContext *context ;
    NSMutableArray *rows;
    NSMutableArray *cols;
    NSMutableArray *col2;
}

@end


@interface ThirdViewController ()

@end

@implementation ThirdViewController
@synthesize mySearchBar, myTableView, initialRecipes, filteredRecipes, isFiltered;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:3];
    }
    return self;
}


- (void)viewDidLoad
{
        // Do any additional setup after loading the view from its nib.
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"3.png"]];
 
    self.parentViewController.view.backgroundColor = [UIColor
                                                      colorWithPatternImage:[UIImage imageNamed:@"3.png"]];
    //self.parentViewController.view.alpha = 1.00;
    
    //--- set the tableview background as clear to view the backsplash
    self.myTableView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"3.png"]];
    self.myTableView.separatorColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"3.png"]];
    [super viewDidLoad];

    [self setTitle:@"Search"];
    //Alloc and init data
   // initialRecipes = [[NSMutableArray alloc]initWithObjects:@"Black Forest Cake", @"Lasagna", @"Aloo Paratha", @"Crab Cake", @"Pork ribs", nil];
    initialRecipes = [self initial];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor]; //must do here in willDisplayCell
    cell.textLabel.backgroundColor =[UIColor clearColor]; //must do here in willDisplayCell
    cell.textLabel.textColor = [UIColor blackColor]; //can do here OR in cellForRowAtIndexPath
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
     initialRecipes = [self initial];
    [myTableView reloadData];
    
}

-(NSMutableArray *) initial{
    AppDelegate *appde = [[UIApplication sharedApplication]delegate];
    context= [appde managedObjectContext];
    
    [[self myTableView]setDataSource:self];
    [[self myTableView]setDelegate:self];
    sections = [[NSMutableArray alloc]init];
    rows=[[NSMutableArray alloc]init];
    cols=[[NSMutableArray alloc]init];
    col2=[[NSMutableArray alloc]init];
    [sections addObject:@"Recipes"];
	// Do any additional setup after loading the view, typically from a nib.
    
    //  [self remove:self];
    
    NSEntityDescription *entidesc = [NSEntityDescription entityForName:@"Recipes" inManagedObjectContext:context];
    
    //Testing
    NSFetchRequest *req = [[NSFetchRequest alloc] init];
    [req setEntity:entidesc];
    // Testing
    
    NSLog(@"loading");
    
    NSError *err;
    NSArray *mdata= [context executeFetchRequest:req error:&err];
    
    if (mdata.count <= 0) {
        [rows addObject:@"Chimichanga"];
        NSLog(@"hyftxedfcxe");
    }
    else
    {
        NSLog(@"in else");
        NSString *recipeName;
        NSString *category;
        NSString *ingredients;
        NSString *steps;
        
        for (recipeDatabase *obj in mdata) {
            recipeName=[obj valueForKey:@"recipeName"];
            category=[obj valueForKey:@"category"];
            ingredients=[obj valueForKey:@"ingredients"];
            steps=[obj valueForKey:@"steps"];
            
            
            
            
            NSString* text = [[[ NSString alloc] initWithFormat:@"%@ ", recipeName]autorelease];
            [rows addObject:text];
        }
    }

    return rows;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(isFiltered == YES){
        return filteredRecipes.count;
        
    }
    else {
        return initialRecipes.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if(isFiltered == YES){
        cell.textLabel.text = [filteredRecipes objectAtIndex:indexPath.row];
        
    }
    else {
         cell.textLabel.text = [initialRecipes objectAtIndex:indexPath.row];
    }

    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(isFiltered == YES){
        for(int i =0;i< filteredRecipes.count; i++){
            NSString* selectedRecipe;
            if(indexPath.row == i)    {
                //selectedRecipe = @"SNACKS";
                DetailRecipeViewController *detailView = [[DetailRecipeViewController alloc]
                                                          initWithNibName:@"DetailRecipeViewController"
                                                          bundle:nil];
                detailView.selectedRecipe= [filteredRecipes objectAtIndex:i];
                NSLog(@"%@", detailView.selectedRecipe);
                [[self navigationController] pushViewController:detailView animated:YES];
                [detailView release];
            }
        }
    }
    else{
    for(int i =0;i< initialRecipes.count; i++){
    NSString* selectedRecipe;
    if(indexPath.row == i)    {
        //selectedRecipe = @"SNACKS";
         DetailRecipeViewController *detailView = [[DetailRecipeViewController alloc]
                                 initWithNibName:@"DetailRecipeViewController"
                                 bundle:nil];
        detailView.selectedRecipe= [initialRecipes objectAtIndex:i];
        NSLog(@"%@", detailView.selectedRecipe);
        [[self navigationController] pushViewController:detailView animated:YES];
        [detailView release];
    }
    }
    }
    
}

#pragma mark UISearchBarDelegate methods
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(searchText.length == 0){
        //set bool fag
        isFiltered = NO;
    }
    else {
        //set bool flag
        isFiltered = YES;
        
        //Alloc and init filtered data
        filteredRecipes = [[NSMutableArray alloc] init];
        
        //Fast enumeration to loop through all values
        for (NSString* cityName in initialRecipes) {
            NSRange cityNameRange = [cityName rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if(cityNameRange.location != NSNotFound){
                [filteredRecipes addObject:cityName];
            }
        }
    }
    
    [myTableView reloadData];
}

//Dismiss keyboard on search
- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [mySearchBar resignFirstResponder];
}

//- (void)dealloc {
//    [_mySearchBar release];
//    [_myTableView release];
//    [super dealloc];
//}
@end
