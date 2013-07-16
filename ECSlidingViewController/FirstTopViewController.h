//
//  FirstTopViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "UnderRightViewController.h"

@interface FirstTopViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView *startTable;
    NSArray *messages;
}

- (IBAction)revealMenu:(id)sender;
- (IBAction)revealUnderRight:(id)sender;

@property (nonatomic, strong) NSArray *messages;

@end
