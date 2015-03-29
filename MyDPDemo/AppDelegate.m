//
//  AppDelegate.m
//  MyDPDemo
//
//  Created by Zkl on 15/3/27.
//  Copyright (c) 2015年 Zkl. All rights reserved.
//

#import "AppDelegate.h"
#import "DiscoverViewController.h"
#import "FirstViewController.h"
#import "GroupPurchaseViewController.h"
#import "MineViewController.h"
#import "KLTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    _window.frame = [[UIScreen mainScreen] bounds];
    
    //设置标签栏
    [self getTabbarController];
    
//    DiscoverViewController *discoverVC = [[DiscoverViewController alloc] init];
//    FirstViewController *firstVC = [[FirstViewController alloc] init];
//    GroupPurchaseViewController *groupVC = [[GroupPurchaseViewController alloc] init];
//    MineViewController *mineVC = [[MineViewController alloc] init];
//
//    UITabBarController *tabBarC = [[UITabBarController alloc] init];
//    tabBarC.viewControllers = @[discoverVC, firstVC, groupVC, mineVC];
    
    
    
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    return YES;
}


//设置标签栏
- (void)getTabbarController {
    KLTabBarViewController *tabBarController = [[KLTabBarViewController alloc] init];

    
//    //设置标签栏背景图片
//    tabBarController.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
    
//    //设置标签栏选中时的颜色
    tabBarController.tabBar.selectedImageTintColor = [UIColor orangeColor];
    
    
    [tabBarController controllerWithString:@"FirstViewController" title:@"首页" andImage:@"home_footbar_icon_dianping_pressed@2x"];
    
    [tabBarController controllerWithString:@"GroupPurchaseViewController" title:@"团购" andImage:@"home_footbar_icon_group_pressed@2x"];
    
    [tabBarController controllerWithString:@"DiscoverViewController" title:@"发现" andImage:@"home_footbar_icon_found_pressed@2x"];//png格式的图片可以不写后缀
    //    discoverVC.urlString = ;//通过给属性赋值的方式设置接口
    
    [tabBarController controllerWithString:@"MineViewController" title:@"我的" andImage:@"home_footbar_icon_my_pressed@2x"];
    
    self.window.rootViewController = tabBarController;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
