//
//  WebViewVideo_ViewController.h
//  foo
//
//  Created by Noodles Wang on 11/8/13.
//  Copyright (c) 2013 Noodles Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  用webview全屏播放视频，当webview load完成以后，ob-c调用js的方法播放视频。
 */
@interface WebViewVideo_ViewController : UIViewController<UIWebViewDelegate>
{
    bool _isMediaOn;
}
@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property (strong, nonatomic) IBOutlet UILabel *label;

@end
