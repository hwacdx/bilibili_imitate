//
//  AppDelegate.m
//  bilibili_imitate
//
//  Created by hw on 16/8/20.
//  Copyright © 2016年 hwacdx. All rights reserved.
//

#import "AppDelegate.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "HWHomeViewController.h"
#import "HWPartionViewController.h"

@interface AppDelegate ()

@property (strong, nonatomic) RDVTabBarController *tabBarVC;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
 
    [self initViewController];
    return YES;
}

- (void)initViewController
{
    HWHomeViewController *homeVC = [HWHomeViewController new];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    HWPartionViewController *partionVC = [HWPartionViewController new];
    UINavigationController *partionNav = [[UINavigationController alloc] initWithRootViewController:partionVC];
    
    self.tabBarVC = [[RDVTabBarController alloc] init];
    self.tabBarVC.viewControllers = @[homeNav, partionNav];
    NSArray *tabBarItemImages = @[@"home_tab", @"partion_tab"];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[self.tabBarVC tabBar] items]) {
        NSString *tempStr = [tabBarItemImages objectAtIndex:index];
        UIImage *unselectedimage = [UIImage imageNamed:tempStr];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_select", tempStr]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        index++;
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.tabBarVC;
    [self.window makeKeyAndVisible];
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
