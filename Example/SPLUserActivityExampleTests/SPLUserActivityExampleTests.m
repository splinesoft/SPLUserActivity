//
//  SPLUserActivityExampleTests.m
//  SPLUserActivityExampleTests
//
//  Created by Jonathan Hersh on 3/1/15.
//  Copyright (c) 2015 Splinesoft. All rights reserved.
//

@import UIKit;
@import XCTest;
@import WebKit;
#import <SPLWebActivity.h>

@interface SPLUserActivityExampleTests : XCTestCase

@end

@implementation SPLUserActivityExampleTests
{
    SPLWebActivity *webActivity;
    WKWebView *webView;
}

- (void)setUp {
    [super setUp];
    
    webView = [[WKWebView alloc] initWithFrame:CGRectZero
                                 configuration:[WKWebViewConfiguration new]];
    
    webActivity = [SPLWebActivity activityWithWKWebView:webView];
}

- (void)tearDown {
    [super tearDown];
    
    [webActivity invalidate];
    webActivity = nil;
}

- (void)testInitializable {
    XCTAssertNotNil(webActivity, @"activity should initialize");
    XCTAssertNotNil(webActivity.userActivity, @"activity should create a user activity");
}

- (void)testNeedsUpdate {
    [webActivity setNeedsUpdate];
    XCTAssertTrue(webActivity.userActivity.needsSave, @"Activity should mark as needing update");
}

- (void)testActivityURL {
    NSURL *url = [NSURL URLWithString:@"http://splinesoft.net"];
    
    SPLWebActivity *URLactivity = [SPLWebActivity activityWithURL:url];
    
    XCTAssertEqualObjects(url, URLactivity.userActivity.webpageURL, @"URL should match");
}

@end
