//
//  AppDelegate.h
//  RecipeApp
//
//  Created by Thatipally, Monika on 11/17/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FirstView;
@class ThirdViewController;
@class NewTableViewController;
@class FavTableViewController;
@class CreateTableViewController;
@class addRecipeViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain) FirstView *firstVC;
@property (nonatomic, retain) addRecipeViewController *arVC;
@property (nonatomic,retain) ThirdViewController *thirdVC;
@property (nonatomic,retain) NewTableViewController *newTableVC;
@property (nonatomic,retain) FavTableViewController *favTableVC;
@property (nonatomic,retain) FavTableViewController *createTableVC;
@property (nonatomic, strong) UITabBarController *tabController;

@property (nonatomic,strong) UINavigationController *nav1;
@property (nonatomic,strong) UINavigationController *nav2;
@property (nonatomic,strong) UINavigationController *nav3;
@property (nonatomic,strong) UINavigationController *nav4;
@property (nonatomic,strong) UINavigationController *nav5;



@property (nonatomic, retain) UINavigationController *navController;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
