//
//  ViewController.m
//  SPLUserActivityExample
//
//  Created by Jonathan Hersh on 3/1/15.
//  Copyright (c) 2015 Splinesoft. All rights reserved.
//

#import "ViewController.h"
@import WebKit;

#import <SPLWebActivity.h>

@interface ViewController () <WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) SPLWebActivity *activity;

@end

@implementation ViewController

- (instancetype)init {
    if ((self = [super init])) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView = [[WKWebView alloc] initWithFrame:self.view.bounds
                                  configuration:[WKWebViewConfiguration new]];
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.webView.navigationDelegate = self;
    
    [self.view addSubview:self.webView];
    
    [self.webView loadRequest:
     [NSURLRequest requestWithURL:
      [NSURL URLWithString:@"http://splinesoft.net"]]];
    
    _activity = [SPLWebActivity activityWithWKWebView:self.webView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.activity invalidate];
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    self.title = webView.title;
}

@end
