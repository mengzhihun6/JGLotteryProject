//
//  JGHtmlViewController.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/14.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGHtmlViewController.h"
#import "JGHtml.h"


@interface JGHtmlViewController () <UIWebViewDelegate>

@end

@implementation JGHtmlViewController

- (void)loadView {
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = webView;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    UIWebView *webView = (UIWebView *)self.view;
    webView.delegate = self;

    NSURL *Url = [[NSBundle mainBundle] URLForResource:_html.html withExtension:nil];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:Url];
    [webView loadRequest:request];
  
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSString *javaScript = [NSString stringWithFormat:@"window.location.href='#%@';",_html.ID];
    
//    JGLog(@" ======= %@",javaScript);
    
    [webView stringByEvaluatingJavaScriptFromString:javaScript];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
