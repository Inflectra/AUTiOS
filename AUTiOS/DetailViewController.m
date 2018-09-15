//
//  DetailViewController.m
//  AUTiOS
//
//  Created by Denis Markovtsev on 01/12/14.
//  Copyright (c) 2014 Inflectra. All rights reserved.
//

#import "DetailViewController.h"
#import "AUTModel.h"


@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(AUTDoc*)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.controlTypeLabel.text = self.detailItem.data.title;
        self.controlImage.image = self.detailItem.fullImage;
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
