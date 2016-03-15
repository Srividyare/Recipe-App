//
//  AppDelegate.m
//  RecipeApp
//
//  Created by Thatipally, Monika on 11/17/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "Firstview.h"

#import "ThirdViewController.h"

#import "NewTableViewController.h"
#import "FavTableViewController.h"
#import "CreateTableViewController.h"
#import "addRecipeViewController.h"
@implementation AppDelegate
@synthesize nav1,nav2,nav3,nav4,thirdVC,newTableVC,favTableVC,firstVC,nav5,arVC;
@synthesize managedObjectContext;// = managedObjectContext;
@synthesize managedObjectModel = managedObjectModel;
@synthesize persistentStoreCoordinator = persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    Firstview *rootView = [[Firstview alloc]
                           initWithNibName:@"Firstview"
                           bundle:nil];
    self.navController = [[UINavigationController alloc] initWithRootViewController:rootView];
    [self.window setRootViewController:self.navController];
    //template code
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    
    Firstview  *aViewController = [[Firstview alloc] initWithNibName:@"Firstview" bundle:nil];
    self.firstVC = aViewController;
    [aViewController release];
    
    
    
    
    ThirdViewController *thirdView = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
    self.thirdVC = thirdView;
    [thirdView release];
    
    
    
    NewTableViewController *fourthView1 = [[NewTableViewController alloc] initWithNibName:@"NewTableViewController" bundle:nil];
    self.newTableVC = fourthView1;
    [fourthView1 release];
    
    FavTableViewController *favView = [[FavTableViewController alloc] initWithNibName:@"FavTableViewController" bundle:nil];
    self.favTableVC = favView;
    [favView release];
    
    addRecipeViewController *addView = [[addRecipeViewController alloc] initWithNibName:@"addRecipeViewController" bundle:nil];
    self.arVC = addView;
    [addView release];
    
    
    
    UINavigationController *navigation5 = [[UINavigationController alloc] initWithRootViewController:firstVC];
    self.nav5 = navigation5;
    [navigation5 release];
    
    
    
    UINavigationController *navigation1 = [[UINavigationController alloc] initWithRootViewController:newTableVC];
    self.nav1 = navigation1;
    [navigation1 release];
    
    
    
    
   // UINavigationController *navigation2 = [[UINavigationController alloc] initWithRootViewController:favTableVC];
   // self.nav2 = navigation2;
   // [navigation2 release];
    
    UINavigationController *navigation2 = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    self.nav2 = navigation2;
    [navigation2 release];
    
    //UINavigationController *navigation4 = [[UINavigationController alloc] initWithRootViewController:fourthVC];
    UINavigationController *navigation3 = [[UINavigationController alloc] initWithRootViewController:arVC];
    self.nav3 = navigation3;
    [navigation3 release];
    
    UITabBarController *tabbar = [[UITabBarController alloc] initWithNibName:@"UITabBarController" bundle:nil];
    self.tabController = tabbar;
    [tabbar release];
    
    NSArray *viewControllersArray = [[NSArray alloc] initWithObjects:nav5, nav1,nav2, nav3, nav4, nil];
    //!! End Changes
    
    
    self.tabController.viewControllers = viewControllersArray;
    
    //UITabBarItem *itm1 = [[UITabBarItem alloc] init
    
    //UITabBarItem *itm1 = self.tabController.tabBar;
    
    //[itm1 setTitle:@"ABC"];
    
    
    
    
    //  self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:3];
    
    //  [self.tabController setViewControllers:viewControllersArray animated:YES];
    self.arVC.managedObjectContext = self.managedObjectContext;
    
    self.window.rootViewController = self.tabController;
   
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"3.png"]];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *) managedObjectContext
{
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"RecipeApp" withExtension:@"momd"];
    managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"RecipeApp.sqlite"];
    
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}
-(void)dealloc
{
    [managedObjectContext release];
    [managedObjectModel release];
    [persistentStoreCoordinator release];
    [firstVC release];
    
    [thirdVC release];
    
    [nav4 release];
    [nav3 release];
    [nav1 release];
    [nav2 release];
    [nav5 release];
    [arVC release];
    [newTableVC release];
    [favTableVC release];
    [super dealloc];
}


@end
