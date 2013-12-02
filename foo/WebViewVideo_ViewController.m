//
//  WebViewVideo_ViewController.m
//  foo
//
//  Created by Noodles Wang on 11/8/13.
//  Copyright (c) 2013 Noodles Wang. All rights reserved.
//

#import "WebViewVideo_ViewController.h"

@interface WebViewVideo_ViewController ()

@end

int i;

@implementation WebViewVideo_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _isMediaOn = NO;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    if (_isMediaOn == NO) {
        i = 5;
        NSLog(@"i = %d",i);
        [super viewWillAppear:animated];
        _label.text = [NSString stringWithFormat:@"%d",i];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.dianjoy.com/aya/testt.html"]];
        [_webview loadRequest:urlRequest];
        [_webview scalesPageToFit];
        _webview.delegate = self;
    }
}

- (void)playMedia:(NSTimer *)timer
{
    _isMediaOn = YES;
    NSLog(@"auto playback enabled:%d", i);
    //    _webview.mediaPlaybackRequiresUserAction = NO;
    _label.text = [NSString stringWithFormat:@"%d",--i];
    if (i == 0) {
        [_webview stringByEvaluatingJavaScriptFromString:@"autoplay()"];
        [timer invalidate];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(playMedia:) userInfo:nil repeats:YES];
}
@end
