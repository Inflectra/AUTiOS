//
//  AUTMain.m
//  AUTiOS
//
//  Created by Denis Markovtsev on 02/12/14.
//  Copyright (c) 2014 Inflectra. All rights reserved.
//

#import "AUTMainController.h"

@interface AUTMainController ()
{
    NSArray *_dropDownData;
}
@end

@implementation AUTMainController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _dropDownData = @[@"Mercury", @"Venus", @"Earth", @"Mars", @"Jupiter", @"Saturn", @"Uranus", @"Neptune"];
    self.dropDown.dataSource = self;
    self.dropDown.delegate = self;
    self.checkItem.on = false;
}

- (IBAction)sendButtonTapped:(UIButton *)sender
{
    NSLog(@"Button Tapped!");
    // Deprecated
    /*
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Message"
                                                   message: self.messageText.text
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK",nil];
    
    [self.view endEditing:YES];
    [alert setTag:1];
    [alrt show];
    */
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Message" message:self.messageText.text preferredStyle:UIAlertControllerStyleAlert];
   
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancel];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)loginButtonTapped:(UIButton *)sender
{
    NSString *res = [NSString stringWithFormat:@"%@/%@", self.userName.text, self.password.text];
    self.loginResult.text = res;
    [self.view endEditing:YES];
}

// The number of columns of data
- (long)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (long)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _dropDownData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _dropDownData[row];
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    self.selectedItem.text = _dropDownData[row];

}

@end
