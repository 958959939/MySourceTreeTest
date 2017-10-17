//
//  AppDelegate.m
//  HanziDictionary
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import "AppDelegate.h"
#import "ProgressBarViewController.h"
#import "HomeViewController.h"
#import "RadicalSearchController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //设置状态栏为黑色透明
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleBlackOpaque;
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];
    //测试进度条
//    ProgressBarViewController *progress=[[ProgressBarViewController alloc]init];
//    self.window.rootViewController=progress;
//    [progress release];
    //测试首页
    HomeViewController *home=[[HomeViewController alloc]init];
    UINavigationController *nvc=[[UINavigationController alloc]initWithRootViewController:home];
    [home release];
    self.window.rootViewController=nvc;
    [nvc release];
    
//    //测试检索页面
//    RadicalSearchController *radser=[[RadicalSearchController alloc]init];
//    self.window.rootViewController=radser;
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
