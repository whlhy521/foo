//
//  BannerVideoViewController.m
//  foo
//
//  Created by Noodles Wang on 11/11/13.
//  Copyright (c) 2013 Noodles Wang. All rights reserved.
//

#import "BannerVideoViewController.h"

@interface BannerVideoViewController ()

@end

@implementation BannerVideoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    _player.view.alpha = 0;
    _download.alpha = 0;
    _continuee.alpha = 0;
    _player.view.frame = self.view.bounds;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    _player.view.alpha = 1;
    self.bannerView.alpha = 1;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"youxi" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    _player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [_player.view setFrame:self.view.bounds];
    [_player.view setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [_player setControlStyle:MPMovieControlStyleNone];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)bannerAdDown:(id)sender
{
    NSLog(@"banner ad down");
    [self.view insertSubview:_player.view atIndex:1];
    [UIView animateWithDuration:0.75 animations:^{
        _player.view.alpha = 1;
        self.bannerView.alpha = 0;
    } completion:^(BOOL finished){
        [_player play];
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(checkPlayback:) userInfo:nil repeats:YES];
    }];
}

- (void)checkPlayback:(NSTimer *)timer
{

    double c = [_player currentPlaybackTime];
    NSLog(@"%f",c);
    if (c > 3) {
        [UIView animateWithDuration:0.5 animations:^{
            self.continuee.alpha = 1;
            self.download.alpha = 1;
        } completion:^(BOOL finish){
            
        }];
        [timer invalidate];
    }
}
- (IBAction)download:(id)sender {
    [self removePanelView];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/wang-zhe-zhi-jian/id597366721?l=en&mt=8"]];
}

- (IBAction)continueDo:(id)sender {
    [self removePanelView];
}

- (void)removePanelView
{
    [_player stop];
    [UIView animateWithDuration:0.5f animations:^{
        _player.view.alpha = 0;
        _continuee.alpha = 0;
        _download.alpha = 0;
        _bannerView.alpha = 1;
    } completion:^(BOOL finished){
        [_player.view removeFromSuperview];
    }];
}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
