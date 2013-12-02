//
//  PluginAdViewController.m
//  foo
//
//  Created by Noodles Wang on 11/13/13.
//  Copyright (c) 2013 Noodles Wang. All rights reserved.
//

#import "PluginAdViewController.h"

@interface PluginAdViewController ()

@end

@implementation PluginAdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)imgPlugin:(id)sender {
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:adDesc.bounds];
    imgView.image = [UIImage imageNamed:@"plugin.png"];
    [adDesc addSubview:imgView];
    adPanel.hidden = NO;
    
    _bgCover.hidden = NO;
}
- (IBAction)videoPlugin:(id)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"youxi" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    _player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [_player.view setFrame:adDesc.bounds];
    [_player setControlStyle:MPMovieControlStyleNone];
    [self performSelector:@selector(play) withObject:nil afterDelay:1.0];
    [adDesc addSubview:_player.view];
    
    adPanel.hidden = NO;
    _bgCover.hidden = NO;
}

- (void)play
{
    [_player play];
}

- (IBAction)download:(id)sender {
    if (_player) {
        [_player stop];
    }
    adPanel.hidden = YES;
    _bgCover.hidden = YES;
    
    for (UIView *view in [adDesc subviews]) {
        [view removeFromSuperview];
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/wang-zhe-zhi-jian/id597366721?l=en&mt=8"]];

}
- (IBAction)close:(id)sender {
    if (_player) {
        [_player stop];
    }
    adPanel.hidden = YES;
    _bgCover.hidden = YES;
    
    for (UIView *view in [adDesc subviews]) {
        [view removeFromSuperview];
    }
}

@end
