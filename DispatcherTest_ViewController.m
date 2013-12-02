//
//  DispatcherTest_ViewController.m
//  foo
//
//  Created by Noodles Wang on 11/14/13.
//  Copyright (c) 2013 Noodles Wang. All rights reserved.
//

#import "DispatcherTest_ViewController.h"

@interface DispatcherTest_ViewController ()

@end

@implementation DispatcherTest_ViewController
static NSString* documentPath(NSString *filename)
{
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [searchPaths objectAtIndex:0];
    return [documentPath stringByAppendingPathComponent:filename];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:documentPath(@"123.plist")];
        [dic setObject:@"123" forKey:@"123"];
        NSLog(@"%@", [dic objectForKey:@"123"]);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)dispatcherDo:(id)sender {
    dispatch_queue_t queue = dispatch_queue_create("HelloWorld", nil);
    static BOOL flag;
    dispatch_async(queue, ^(void){
        int sum = 0;
        for (int i=0; i<=10; i++) {
            sum += i;
            NSLog(@">> Sum:%d",sum);
        }
        flag = YES;
    });
    while (!flag){
        NSLog(@"this is a log.");
    };
    NSLog(@"complete");
//    dispatch_release(queue);
    
}

- (void)requestData:(NSString *)url result:(void(^)(NSError*))result
{
    NSLog(url);
    resultBlock = result;
}

- (IBAction)block:(id)sender {
//    void (^aBlock)(void) = ^(void){NSLog(@"Hello World");};
//    aBlock();
    
//    void (^block0)(void) = 0;
//    block0 = ^(void){NSLog(@"123321");};
//    block0();
    
//    [self requestData:@"this a request" result:^(NSError *error){
//        if (error) {
//            NSLog(@"request error");
//        } else {
//            NSLog(@"request success");
//        }
//    }];
    
    actionType action = ^(int a){NSLog(@"%d",a);};
    action(2);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
