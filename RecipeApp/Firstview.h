//
//  Firstview.h
//  tabeg
//
//  Created by Tummala, Keerthana on 11/2/14.
//  Copyright (c) 2014 Tummala, Keerthana. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Firstview;

@protocol FirstviewDelegate
- (void)FirstviewDidFinish:(Firstview *)controller;
@end

@interface Firstview : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (assign, nonatomic) id <FirstviewDelegate> delegate;


@property (retain, nonatomic) IBOutlet UITableView *list;
- (IBAction)showRecipe:(id)sender;

@end
