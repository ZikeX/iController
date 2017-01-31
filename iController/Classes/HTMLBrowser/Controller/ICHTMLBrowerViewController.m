//
//  ICHTMLBrowerViewController.m
//  iController
//
//  Created by 吴双 on 16/2/8.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICHTMLBrowerViewController.h"

@interface ICHTMLBrowerViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation ICHTMLBrowerViewController

- (instancetype)initWithFileName:(NSString *)fileName {
	self = [self init];
	if (self) {
		NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"html"];
		[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view addSubview:self.webView];
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	self.webView.frame = self.view.bounds;
}

#pragma mark - Web view delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
	
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
}

//- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
//
//}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	
}

- (UIWebView *)webView {
	if (!_webView) {
		_webView = [UIWebView new];
		_webView.delegate = self;
	}
	return _webView;
}

@end
