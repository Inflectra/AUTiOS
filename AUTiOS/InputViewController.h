//
//  InputViewController.h
//  AUTiOS
//
//  Created by Denis Markovtsev on 02/12/14.
//  Copyright (c) 2014 Inflectra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MasterViewController;

@interface InputViewController : UIViewController

@property (strong) NSString *initialValue;
@property (weak, nonatomic) MasterViewController *masterViewController;
@property (weak, nonatomic) IBOutlet UITextField *editFieldItemName;

@end
