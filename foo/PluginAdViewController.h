//
//  PluginAdViewController.h
//  foo
//
//  Created by Noodles Wang on 11/13/13.
//  Copyright (c) 2013 Noodles Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface PluginAdViewController : UIViewController
{
    IBOutlet UIView *_bgCover;
    IBOutlet UIView *adPanel;
    IBOutlet UIView *adDesc;
    
    MPMoviePlayerController *_player;
}
@end
