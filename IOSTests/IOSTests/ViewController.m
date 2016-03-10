//
//  ViewController.m
//  IOSTests
//
//  Created by mac-mini-ios on 15/12/29.
//  Copyright © 2015年 mac-mini-ios. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "OneLoadingAnimationView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet OneLoadingAnimationView *animationView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self TestCase];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (IBAction)onTapStartAnimation:(id)sender
{
    [self.animationView startSuccess];
}

- (IBAction)onTapFailAnimation:(id)sender
{
    [self.animationView startFail];
}

//线程测试 最终打印结果 1 5 9 6 2 (骚年你知道吗)
- (void)TestCase
{
    dispatch_queue_t serialQueue = dispatch_queue_create("aaa", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1");
    dispatch_async(serialQueue, ^{
        [NSThread sleepForTimeInterval:2.0f];
        NSLog(@"2");
        dispatch_sync(serialQueue, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    NSLog(@"5");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"6");
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"7");
        });
        NSLog(@"8");
    });
    NSLog(@"9");
    while (1)
    {
        
    }
}

@end
