//
//  Dispaly.h
//  tabeg
//
//  Created by Thatipally, Monika on 11/17/14.
//  Copyright (c) 2014 Thatipally, Monika. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Dispaly;
@class DetailRecipeViewController;

@protocol DispalyDelegate
- (void)DispalyDidFinish:(Dispaly *)controller;
@end

@interface Dispaly : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (assign, nonatomic) id <DispalyDelegate> delegate;

@property (nonatomic, strong) NSString* cate;

@property (retain, nonatomic) IBOutlet UITableView *list;
//- (IBAction)showRecipe:(id)sender;

@end
