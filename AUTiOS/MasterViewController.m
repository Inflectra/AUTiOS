//
//  MasterViewController.m
//  AUTiOS
//
//  Created by Denis Markovtsev on 01/12/14.
//  Copyright (c) 2014 Inflectra. All rights reserved.
//

#import "MasterViewController.h"
#import "InputViewController.h"
#import "DetailViewController.h"
#import "AUTModel.h"
#import "AUTDoc.h"


@implementation MasterViewController

@synthesize objects = _objects;

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AUTDoc *item1 = [[AUTDoc alloc] initWithTitle:@"Button" rating:4 thumbImage:[UIImage imageNamed:@"Button.png"] fullImage:[UIImage imageNamed:@"Button.png"]];
    AUTDoc *item2 = [[AUTDoc alloc] initWithTitle:@"Text" rating:3 thumbImage:[UIImage imageNamed:@"Text.png"] fullImage:[UIImage imageNamed:@"Text.png"]];
    AUTDoc *item3 = [[AUTDoc alloc] initWithTitle:@"Table" rating:5 thumbImage:[UIImage imageNamed:@"Table.png"] fullImage:[UIImage imageNamed:@"Table.png"]];
    AUTDoc *item4 = [[AUTDoc alloc] initWithTitle:@"Combo Box" rating:1 thumbImage:[UIImage imageNamed:@"ComboBox.png"] fullImage:[UIImage imageNamed:@"ComboBox.png"]];
    
    NSMutableArray *items = [NSMutableArray arrayWithObjects:item1, item2, item3, item4, nil];
    _objects = items;
    
    
    self.navigationItem.leftItemsSupplementBackButton = TRUE;
    self.navigationItem.leftBarButtonItem = self.editButtonItem;


    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    //self.title = @"AUT Items";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {

    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    
    int itemCount = (int)[self.objects  count];
    NSString *itemName = [NSString stringWithFormat:@"New Control %d", itemCount];
    
    if (_inputViewController == nil) {
        _inputViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"New Item Navigation"];
    }
    
    [(InputViewController *)[_inputViewController topViewController] setMasterViewController:self];
    [(InputViewController *)[_inputViewController topViewController] setInitialValue:itemName ];
    [self presentViewController:_inputViewController animated:YES completion:NULL];
    
    NSLog(@"New item added");
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        AUTDoc *object = self.objects[indexPath.row];
        UIViewController *viewController =[segue destinationViewController];
        DetailViewController *detailController;
        if ([viewController isKindOfClass:[DetailViewController class]])
        {
            detailController = (DetailViewController *)viewController;
        }
        else
        {
            detailController = (DetailViewController *)[[segue destinationViewController] topViewController];
        }
        [detailController setDetailItem:object];
        //detailController.navigationItem.leftBarButtonItem = self.;
        //detailController.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyBasicCell"];
    AUTDoc *item = [_objects objectAtIndex:indexPath.row];
    cell.textLabel.text = item.data.title;
    cell.imageView.image = item.thumbImage;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
