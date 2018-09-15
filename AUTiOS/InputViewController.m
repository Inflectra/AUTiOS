//
//  InputViewController.m
//  AUTiOS
//
//  Created by Denis Markovtsev on 02/12/14.
//  Copyright (c) 2014 Inflectra. All rights reserved.
//

#import "InputViewController.h"
#import "MasterViewController.h"
#import "AUTDoc.h"

@implementation InputViewController

@synthesize initialValue = _initialValue;
@synthesize masterViewController = _masterViewController;

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelItem:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveItem:)];
    self.navigationItem.rightBarButtonItem = saveButton;

    self.editFieldItemName.text = _initialValue;
}

- (void) saveItem:(id)sender {
    
    NSString *itemName = self.editFieldItemName.text;
    
    AUTDoc *item1 = [[AUTDoc alloc] initWithTitle:itemName rating:4 thumbImage:[UIImage imageNamed:@"Tree.png"] fullImage:[UIImage imageNamed:@"Tree.png"]];
     
    [_masterViewController.objects insertObject:item1 atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [_masterViewController.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) cancelItem:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
