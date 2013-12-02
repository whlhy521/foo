//
//  VideoFullScreenAD_ViewController.h
//  foo
//
//  Created by Noodles Wang on 11/8/13.
//  Copyright (c) 2013 Noodles Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
/**
 *  插屏式富媒体广告
 */
@interface VideoFullScreenAD_ViewController : UIViewController
{
    UIView *panelView;
    MPMoviePlayerController *player;
    IBOutlet UIButton *_download;
    IBOutlet UIButton *_continue;
}
@end
