//
//  DetailVC.m
//  时光网
//
//  Created by 汇文 on 15/11/5.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic,strong) UIActivityIndicatorView *indicator;

@end

@implementation DetailVC

- (UIWebView *)webView
{
    if (_webView == nil) {
        _webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _webView.scalesPageToFit = YES;
        _webView.delegate = self;
        [self.view addSubview:_webView];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.indicator];
}

- (void)loadData
{
    NSDictionary *dic = [DataRequirst jsonData:@"news_detail.json"];
    NSString *content = dic[@"content"];
    NSString *title = dic[@"title"];
    NSString *subTitle = [NSString stringWithFormat:@"%@ %@",dic[@"source"],dic[@"time"]];
    NSString *author = [NSString stringWithFormat:@"编辑（%@）",dic[@"author"] ];
    
    NSString *html = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"news.html" ofType:nil] encoding:NSUTF8StringEncoding error:nil];
    
    
    [self.webView loadHTMLString:[NSString stringWithFormat:html,title,subTitle,content,author] baseURL:nil];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.indicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.indicator stopAnimating];
}

@end
