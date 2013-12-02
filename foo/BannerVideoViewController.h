//
//  BannerVideoViewController.h
//  foo
//
//  Created by Noodles Wang on 11/11/13.
//  Copyright (c) 2013 Noodles Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface BannerVideoViewController : UIViewController
{
    MPMoviePlayerController *_player;
}
@property (strong, nonatomic) IBOutlet UIButton *download;
@property (strong, nonatomic) IBOutlet UIButton *continuee;
@property (strong, nonatomic) IBOutlet UIView *bannerView;
@end
