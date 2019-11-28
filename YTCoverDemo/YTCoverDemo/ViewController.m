//
//  ViewController.m
//  YTCoverDemo
//
//  Created by admin on 2019/10/24.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+appear.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    // 保存原来的亮度
//    [[NSUserDefaults standardUserDefaults] setObject:@([UIScreen mainScreen].brightness) forKey:@"brightness"];
//    // 保存状态，需要为用户变化屏幕亮度功能
//    [[NSUserDefaults standardUserDefaults] setObject:@YES forKey:@"ifNeedChangeLight"];
    
    NSLog(@"---1-----viewDidLoad---");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"---1-----viewWillAppear---");
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"---1---------viewWillDisappear");
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[NSClassFromString(@"YTViewController") new] animated:true];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    NSLog(@"------viewDidAppear");

    if ([UIScreen mainScreen].brightness < 0.8) {
        [UIScreen mainScreen].brightness = 0.8;
    }
}

- (void)viewDidDisAppear:(BOOL)animated
{
    [super viewDidDisappear:animated];

    NSLog(@"------viewDidDisAppear");

    // 还原
    [UIScreen mainScreen].brightness = [[[NSUserDefaults standardUserDefaults] objectForKey:@"brightness"] floatValue];
    [[NSUserDefaults standardUserDefaults] setObject:@NO forKey:@"ifNeedChangeLight"];
}

@end
