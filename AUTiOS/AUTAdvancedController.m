//
//  AUTAdvancedController.m
//  AUTiOS
//
//  Created by Denis Markovtsev on 12/02/15.
//  Copyright (c) 2015 Inflectra. All rights reserved.
//

#import "AUTAdvancedController.h"

@interface AUTAdvancedController ()

@end

@implementation AUTAdvancedController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *urlAddress = @"http://www.google.com";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:requestObj];
    [_pageControl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pageTurn:(UIPageControl *) page
{
    int c = (int)page.currentPage;
    if (c == 0)
    {
        _pageControl.backgroundColor = [UIColor blueColor];
    }
    else if (c == 1)
    {
        _pageControl.backgroundColor = [UIColor redColor];
    }
    else if (c == 2)
    {
        _pageControl.backgroundColor = [UIColor greenColor];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
