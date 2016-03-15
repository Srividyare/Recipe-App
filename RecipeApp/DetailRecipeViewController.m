//
//  DetailRecipeViewController.m
//  RecipeApp
//
//  Created by Siddartha Guthikonda on 12/6/14.
//  Copyright (c) 2014 Siddartha Guthikonda. All rights reserved.
//

#import "DetailRecipeViewController.h"
#import "AppDelegate.h"
#import "recipeDatabase.h"

@interface DetailRecipeViewController ()
{
    
    NSMutableArray *sections;
    NSManagedObjectContext *context ;
    NSMutableArray *rows;
    NSMutableArray *cols;
    NSMutableArray *col2;
}

@end

@interface DetailRecipeViewController ()

@end

@implementation DetailRecipeViewController

@synthesize ingredients,recipeName,method, selectedRecipe;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //recipeName.text = @"Print the name here";
    
    [self printRecipe];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"3.png"]];
}


-(void) printRecipe{
    AppDelegate *appde = [[UIApplication sharedApplication]delegate];
    context= [appde managedObjectContext];
    
    NSEntityDescription *entidesc = [NSEntityDescription entityForName:@"Recipes" inManagedObjectContext:context];
    
    //Testing
    NSFetchRequest *req = [[NSFetchRequest alloc] init];
   // NSPredicate *predicate = [NSPredicate predicateWithFormat:@"recipeName == %@", selectedRecipe];
    
    [req setEntity:entidesc];
    //[req setPredicate:predicate];
    // Testing
    
    NSLog(@"loading");
    
    NSError *err;
    NSArray *mdata= [context executeFetchRequest:req error:&err];
    
    //    if (mdata.count <= 0) {
    //        [rows addObject:@"OOPS, No Recipes found, Please add one"];
    //        NSLog(@"hyftxedfcxe");
    //    }
    //else
    // {
    NSLog(@"in else");
    NSString *rName;
    NSString *category;
    NSString *ingre;
    NSString *steps;
    
    for (recipeDatabase *obj in mdata) {
        rName=[obj valueForKey:@"recipeName"];
        category=[obj valueForKey:@"category"];
        ingre=[obj valueForKey:@"ingredients"];
        steps=[obj valueForKey:@"steps"];
        NSString *sRecipe = [selectedRecipe stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"%lu", (unsigned long)rName.length);
        NSLog(@"%lu", (unsigned long)sRecipe.length);
       // NSLog(@"%@", sRecipe);
        
        if([sRecipe isEqualToString:rName])
        {
            NSLog(@"IN IF");
            NSString* text = [[[ NSString alloc] initWithFormat:@"%@ ", rName]autorelease];
            //[rows addObject:text];
            recipeName.text = text;
            ingredients.text = ingre;
            method.text = steps;
            
            NSLog(@"%@", text);
        }
        
        
        
        
        
        
    }
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [recipeName release];
    [ingredients release];
    [method release];
    [super dealloc];
}
@end
