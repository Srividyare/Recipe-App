//
//  addRecipeViewController.h
//  RecipeApp
//
//  Created by  on 12/4/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import <UIKit/UIKit.h>


#import <CoreData/CoreData.h>
@interface addRecipeViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (retain, nonatomic) IBOutlet UITextField *steps;
@property (retain, nonatomic) IBOutlet UITextField *recipeName;
@property (retain, nonatomic) IBOutlet UITextField *category;
@property (retain, nonatomic) IBOutlet UITextField *ingredients;
- (IBAction)Add:(id)sender;
@end
