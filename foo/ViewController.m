//
//  ViewController.m
//  foo
//
//  Created by Noodles Wang on 11/7/13.
//  Copyright (c) 2013 Noodles Wang. All rights reserved.
//

#import "ViewController.h"
#import "WebViewVideo_ViewController.h"
#import "MyTableViewCell.h"
#import "VideoFullScreenAD_ViewController.h"
#import "BannerVideoViewController.h"
#import "PluginAdViewController.h"
#import "DispatcherTest_ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.title = NSLocalizedString(@"My Demo", @"My Demo");
    _menuList = [[NSMutableArray alloc] init];
    
    WebViewVideo_ViewController *wvController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"WebViewVideo_ViewController"];
    [_menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"webview video",@"title",wvController,@"viewController", nil]];
    
    VideoFullScreenAD_ViewController *vfController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"VideoFullScreenAD_ViewController"];
    [_menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Full Screen Video Ad",@"title",vfController,@"viewController", nil]];
    
    BannerVideoViewController *avController = [[BannerVideoViewController alloc] initWithNibName:@"BannerVideoViewController" bundle:nil];
    [_menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"banner ad(video)",@"title",avController,@"viewController",nil]];
    
    PluginAdViewController *paController = [[PluginAdViewController alloc] initWithNibName:@"PluginAdViewController" bundle:nil];
    [_menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"plugin ad",@"title",paController,@"viewController",nil]];
    
    DispatcherTest_ViewController *dtController = [[DispatcherTest_ViewController alloc] initWithNibName:@"DispatcherTest_ViewController" bundle:nil];
    [_menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"block and dispatch", @"title", dtController, @"viewController", nil]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _menuList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    cell.textLabel.text = [[_menuList objectAtIndex:indexPath.row] objectForKey:@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[[_menuList objectAtIndex:indexPath.row] objectForKey:@"viewController"] animated:YES];
}

@end
