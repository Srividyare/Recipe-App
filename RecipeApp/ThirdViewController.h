//
//  ThirdViewController.h
//  tabeg
//
//  Created by Srividya Rentala on 11/2/14.
//  Copyright (c) 2014 Srividya Rentala. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailRecipeViewController;
@interface ThirdViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (retain, nonatomic) IBOutlet UISearchBar *mySearchBar;

@property (retain, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray * initialRecipes;
@property (nonatomic, strong) NSMutableArray * filteredRecipes;
@property BOOL isFiltered;

@end
