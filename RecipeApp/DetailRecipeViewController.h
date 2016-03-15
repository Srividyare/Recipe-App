//
//  DetailRecipeViewController.h
//  RecipeApp
//
//  Created by Siddartha Guthikonda on 12/6/14.
//  Copyright (c) 2014 Siddartha Guthikonda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailRecipeViewController : UIViewController

@property (nonatomic, strong) NSString* selectedRecipe;

@property (retain, nonatomic) IBOutlet UILabel *recipeName;

@property (retain, nonatomic) IBOutlet UILabel *ingredients;

@property (retain, nonatomic) IBOutlet UILabel *method;

@end
