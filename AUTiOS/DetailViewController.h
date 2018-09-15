//
//  DetailViewController.h
//  AUTiOS
//
//  Created by Denis Markovtsev on 01/12/14.
//  Copyright (c) 2014 Inflectra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AUTDoc.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) AUTDoc *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *controlTypeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *controlImage;

@end

