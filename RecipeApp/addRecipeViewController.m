//
//  addRecipeViewController.m
//  RecipeApp
//
//  Created by  on 12/4/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "addRecipeViewController.h"

@interface addRecipeViewController ()

@end

@implementation addRecipeViewController

@synthesize steps,managedObjectContext,recipeName,ingredients,category;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
        
        self.title=@"Add Recipes";
        self.tabBarItem.image=[UIImage imageNamed:@"plus-simple-7.png"];
        
        
        
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Add Recipe"];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"3.png"]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    if (theTextField == steps) {
        [steps resignFirstResponder];
    }
    if (theTextField == recipeName) {
        [recipeName resignFirstResponder];
    }
    if (theTextField == ingredients) {
        [ingredients resignFirstResponder];
    }
    if (theTextField == category) {
        [category resignFirstResponder];
    }
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Add:(id)sender {
    NSEntityDescription *entidesc = [NSEntityDescription entityForName:@"Recipes" inManagedObjectContext:managedObjectContext];
    
    NSManagedObject *insert= [[[NSManagedObject alloc]initWithEntity:entidesc insertIntoManagedObjectContext:managedObjectContext]autorelease];
    
    
    
    
    
    
    
    [insert setValue:self.recipeName.text forKey:@"recipeName"];
    [insert setValue:self.category.text forKey:@"category"];
    [insert setValue:self.ingredients.text forKey:@"ingredients"];
    [insert setValue:self.steps.text forKey:@"steps"];
    
    
    
    // NSError *error ;
    NSError *error ;
    bool success = [managedObjectContext save:&error];
    if(!success)
    {
        //result.text= @"Handle the error";
        NSLog(@"%@", error.localizedDescription);
    }
    
    
    
    
    
    recipeName.text= @" ";
    category.text=@" " ;
    ingredients.text= @" ";
    steps.text=@" " ;
    
}
@end
