//
//  recipeDatabase.h
//  RecipeApp
//
//  Created by  on 12/4/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface recipeDatabase : NSManagedObject

@property (nonatomic, retain) NSString * recipeName;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * ingredients;
@property (nonatomic, retain) NSString * steps;

@end
