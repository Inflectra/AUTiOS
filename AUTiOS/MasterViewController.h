//
//  MasterViewController.h
//  AUTiOS
//
//  Created by Denis Markovtsev on 01/12/14.
//  Copyright (c) 2014 Inflectra. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InputViewController;
@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) UINavigationController *inputViewController;
@property (strong, nonatomic) DetailViewController *detailViewController;

@property NSMutableArray *objects;

@end

