//
//  AUTMain.h
//  AUTiOS
//
//  Created by Denis Markovtsev on 02/12/14.
//  Copyright (c) 2014 Inflectra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AUTMainController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *messageText;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UILabel *loginResult;
@property (weak, nonatomic) IBOutlet UIPickerView *dropDown;
@property (weak, nonatomic) IBOutlet UILabel *selectedItem;
@property (weak, nonatomic) IBOutlet UISwitch *checkItem;

- (IBAction)sendButtonTapped:(UIButton *)sender;
- (IBAction)loginButtonTapped:(UIButton *)sender;

@end
