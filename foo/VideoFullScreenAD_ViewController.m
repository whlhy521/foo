//
//  VideoFullScreenAD_ViewController.m
//  foo
//
//  Created by Noodles Wang on 11/8/13.
//  Copyright (c) 2013 Noodles Wang. All rights reserved.
//

#import "VideoFullScreenAD_ViewController.h"

@interface VideoFullScreenAD_ViewController ()

@end

@implementation VideoFullScreenAD_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]]];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"youxi" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    panelView = [[UIView alloc] initWithFrame:self.view.bounds];
    panelView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:panelView];
    
    
    player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [player setControlStyle:MPMovieControlStyleNone];
    [player prepareToPlay];
    [player.view setFrame:panelView.bounds];
    [player.view setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [panelView addSubview:player.view];
    [player play];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackOvered:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playMedia:) name:UIApplicationWillEnterForegroundNotification object:nil];
    [self assignBtns];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [player stop];
}

- (void)playMedia:(NSNotification *)notification
{
    if (player) {
        [player play];
    }
}
- (void)assignBtns
{
    //    _download = [UIButton buttonWithType:UIButtonTypeCustom];
    //    _download.frame = CGRectMake(50, 491, 75, 40);
    //    [_download addTarget:self action:@selector(download:) forControlEvents:UIControlEventTouchUpInside];
    //    [_download setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleBottomMargin];
    //    _download.backgroundColor = [UIColor orangeColor];
    //    [_download setTitle:@"下载" forState:UIControlStateNormal];
    //    _download.titleLabel.textColor = [UIColor blueColor];
    ////    _download.hidden = YES;
    //    [panelView addSubview:_download];
    //
    //    _continue = [UIButton buttonWithType:UIButtonTypeCustom];
    //    _continue.frame = CGRectMake(202, 491, 75, 40);
    //    [_continue addTarget:self action:@selector(continued:) forControlEvents:UIControlEventTouchUpInside];
    //    [_continue setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin |UIViewAutoresizingFlexibleBottomMargin];
    //    _continue.backgroundColor = [UIColor orangeColor];
    //    [_continue setTitle:@"继续" forState:UIControlStateNormal];
    //    _continue.titleLabel.textColor = [UIColor blueColor];
    ////    _download.hidden = YES;
    //    [panelView addSubview:_continue];
    
    _download.hidden = YES;
    _continue.hidden = YES;
    [panelView addSubview:_download];
    [panelView addSubview:_continue];
}

- (IBAction)download:(id)selector
{
    [self removePanelView];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/wang-zhe-zhi-jian/id597366721?l=en&mt=8"]];
}

- (IBAction)continued:(id)selector
{
    NSLog(@"continue btn touched");
    [self removePanelView];
}

- (void)removePanelView
{
    [UIView animateWithDuration:0.5f animations:^{
        panelView.alpha = 0;
    } completion:^(BOOL finished){
        [panelView removeFromSuperview];
        player = nil;
    }];
}

- (void)playbackOvered:(NSNotification *) notification
{
    NSLog(@"playback over");
    _download.hidden = NO;
    _continue.hidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
