//
//  DispatcherTest_ViewController.h
//  foo
//
//  Created by Noodles Wang on 11/14/13.
//  Copyright (c) 2013 Noodles Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DispatcherTest_ViewController : UIViewController
{
    void(^resultBlock)(NSError *);
    void(^resultBlock0)(void);
}

typedef void(^actionType)(int a);

@end
