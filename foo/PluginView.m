//
//  PluginView.m
//  foo
//
//  Created by Noodles Wang on 11/13/13.
//  Copyright (c) 2013 Noodles Wang. All rights reserved.
//

#import "PluginView.h"

@implementation PluginView

- (id)initWithFrame:(CGRect)frame adType:(DianJoyPluginAdType)type
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self assignSubViews:type];
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
    }
    return self;
}

- (void)assignSubViews:(DianJoyPluginAdType)type
{

}

- (void)willMoveToSuperview:(UIView *)newSuperview
{

}

@end
