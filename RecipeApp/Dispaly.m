//
//  Dispaly.m
//  tabeg
//
//  Created by Thatipally, Monika on 11/17/14.
//  Copyright (c) 2014 Thatipally, Monika. All rights reserved.
//

#import "Dispaly.h"
#import "AppDelegate.h"
#import "recipeDatabase.h"
#import "DetailRecipeViewController.h"

@interface Dispaly ()
{
    
    NSMutableArray *sections;
    NSManagedObjectContext *context ;
    NSMutableArray *rows;
    NSMutableArray *cols;
    NSMutableArray *col2;
}

@end

@interface Dispaly ()

@end

@implementation Dispaly

@synthesize list, cate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
        
        self.title=@"Category Recipes";
        // self.tabBarItem.image=[UIImage imageNamed:@"home.png"];
        
        
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Category"];
    NSString *c = cate;
    NSLog(@"%@", c);
    [self showRecipe];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"3.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sections count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [rows count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sections objectAtIndex:section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier = @"cell" ;
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    
    if(!cell)
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier] autorelease];
    }
    
    if (indexPath.section== 1) {
        cell.textLabel.text=[rows objectAtIndex:indexPath.row];
        
    }
    
    if (indexPath.section== 0) {
        cell.textLabel.text=[rows objectAtIndex:indexPath.row];
        
    }
    
    
    return cell;
    
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    for(int i =0;i< rows.count; i++){
        NSString* selectedRecipe;
        if(indexPath.row == i)    {
            //selectedRecipe = @"SNACKS";
            DetailRecipeViewController *detailView = [[DetailRecipeViewController alloc]
                                                      initWithNibName:@"DetailRecipeViewController"
                                                      bundle:nil];
            detailView.selectedRecipe= [rows objectAtIndex:i];
            NSLog(@"%@", detailView.selectedRecipe);
            [[self navigationController] pushViewController:detailView animated:YES];
            [detailView release];
        }
    }
}


- (void)remove:(id)sender {
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Recipes" inManagedObjectContext:context];
    NSFetchRequest *request = [[[NSFetchRequest alloc]init]autorelease];
    [request setEntity:entityDesc];
    
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"dueDate <  %@",[NSDate date]];
    //[request setPredicate:predicate];
    
    NSError *error;
    NSArray *matchingData =[context executeFetchRequest:request error:&error];
    
    if(matchingData.count<=0){
        
    }
    else
    {
        
        for(NSManagedObject *obj in matchingData){
            [context deleteObject:obj];
            
        }
        [context save:&error];
        
    }
}


- (void)dealloc {
    [list release];
    [super dealloc];
}
- (void)showRecipe {
    NSLog(@"In show Recipe");
    AppDelegate *appde = [[UIApplication sharedApplication]delegate];
    context= [appde managedObjectContext];
    
    [[self list]setDataSource:self];
    [[self list]setDelegate:self];
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
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", cate];

    [req setEntity:entidesc];
    [req setPredicate:predicate];
    // Testing
    
    NSLog(@"loading");
    
    NSError *err;
    NSArray *mdata= [context executeFetchRequest:req error:&err];
    
    if (mdata.count <= 0) {
        [rows addObject:@"Oops, No Recipes found, Please add one"];
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
            
            if([category isEqualToString:cate]){
                NSString* text = [[[ NSString alloc] initWithFormat:@"%@ ", recipeName]autorelease];
                [rows addObject:text];
                
                NSLog(@"%@", text);
            }
            
            
           
            
            
        }
    }
    
    [req release];
    [[self list]reloadData];
}


@end
