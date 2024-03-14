//
//  AUTAdvancedController.h
//  AUTiOS
//
//  Created by Denis Markovtsev on 12/02/15.
//  Copyright (c) 2015 Inflectra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WKWebView.h>

@interface AUTAdvancedController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@end
