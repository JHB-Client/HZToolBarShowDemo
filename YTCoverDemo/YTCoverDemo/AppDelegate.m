//
//  AppDelegate.m
//  YTCoverDemo
//
//  Created by admin on 2019/10/24.
//  Copyright © 2019 admin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
    NSLog(@"======applicationWillResignActive");
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"ifNeedChangeLight"] boolValue]) {
        
        float brightness = [UIScreen mainScreen].brightness = [[[NSUserDefaults standardUserDefaults] objectForKey:@"brightness"] floatValue];
        [UIScreen mainScreen].brightness = brightness;
//        [NSTimer scheduledTimerWithTimeInterval:0.01 repeats:YES block:^(NSTimer * _Nonnull timer) {
//            if ([UIScreen mainScreen].brightness < brightness) {
//                [timer invalidate];
//                timer = nil;
//            } else {
//                [UIScreen mainScreen].brightness -= 0.01;
//            }
//        }];
        }
   
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    NSLog(@"--=======");
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    NSLog(@"======applicationDidBecomeActive");
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"ifNeedChangeLight"] boolValue]) {
        
        
            if ([UIScreen mainScreen].brightness < 0.8) {
                // 颜色需要渐变的话需要另外再写
//                [UIScreen mainScreen].brightness = 0.8;
                [NSTimer scheduledTimerWithTimeInterval:0.01 repeats:YES block:^(NSTimer * _Nonnull timer) {
                    if ([UIScreen mainScreen].brightness > 0.8) {
                        [timer invalidate];
                        timer = nil;
                    } else {
                        [UIScreen mainScreen].brightness += 0.01;
                    }
                }];
                
            }
        }
   
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
