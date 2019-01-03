//
//  AppDelegate.m
//  IOS
//
//  Created by 杨丰林 on 2018/12/19.
//  Copyright © 2018年 杨丰林. All rights reserved.
//

#import "AppDelegate.h"
#import "YFLBaseNavigationController.h"
#import "OneHomeViewController.h"
#import "TwoHomeViewController.h"
#import "ThreeHomeViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self tabViewInit];
    
    return YES;
}

-(void)tabViewInit{
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    //
    YFLBaseNavigationController *oneNav = [[YFLBaseNavigationController alloc]initWithRootViewController:[[OneHomeViewController alloc]init]];
    oneNav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor grayColor]};
    oneNav.navigationBar.translucent = NO;
    oneNav.title = @"ONE 1";
    
    //
    YFLBaseNavigationController *twoNav = [[YFLBaseNavigationController alloc]initWithRootViewController:[[TwoHomeViewController alloc]init]];
    twoNav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor grayColor]};
    twoNav.navigationBar.translucent = NO;
    twoNav.title = @"TWO 2";

    
    //
    YFLBaseNavigationController *threeNav = [[YFLBaseNavigationController alloc]initWithRootViewController:[[ThreeHomeViewController alloc]init]];
    threeNav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor grayColor]};
    threeNav.navigationBar.translucent = NO;
    threeNav.title = @"THREE 3";

    
    UITabBarController *tagVC = [[UITabBarController alloc]init];
    tagVC.viewControllers = @[oneNav,twoNav,threeNav];
    tagVC.tabBar.translucent = NO;//是否透明
    
    
    self.window.rootViewController = tagVC;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
