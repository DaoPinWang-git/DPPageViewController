//
//  DPAppDelegate.m
//  DPPageViewController
//
//  Created by 413655409@qq.com on 02/14/2017.
//  Copyright (c) 2017 413655409@qq.com. All rights reserved.
//

#import "DPAppDelegate.h"
#import "DPPageViewController.h"

@implementation DPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UIViewController *vc1 = [UIViewController new];
    vc1.title = @"first";
    vc1.view.backgroundColor = [UIColor redColor];
    
    UIViewController *vc2 = [UIViewController new];
    vc2.title = @"second";
    vc2.view.backgroundColor = [UIColor blueColor];
    
    UIViewController *vc3 = [UIViewController new];
    vc3.title = @"third";
    vc3.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController *vc4 = [UIViewController new];
    vc4.title = @"fourth";
    vc4.view.backgroundColor = [UIColor lightGrayColor];
    
    DPPageViewController *pagevc = [[DPPageViewController alloc] initWithTitle:@"Page View Controller" viewControllers:@[vc1,vc2,vc3,vc4]];
    
    pagevc.selectTitleZoomMultiple = 1.5;
    pagevc.commonColor = [UIColor blueColor];
    pagevc.selectColor = [UIColor redColor];
    
    UIView *middleView = [UIView new];
    middleView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
    UILabel *middleLabel = [UILabel new];
    middleLabel.textAlignment = NSTextAlignmentCenter;
    middleLabel.text = @"Middle View";
    [middleView addSubview:middleLabel];
    middleLabel.frame = middleView.bounds;
    pagevc.middleView = middleView;
    
    
    UIView *bottomView = [UIView new];
    bottomView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
    UILabel *bottomLabel = [UILabel new];
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    bottomLabel.text = @"Bottom View";
    [bottomView addSubview:bottomLabel];
    bottomLabel.frame = bottomView.bounds;
    pagevc.bottomView = bottomView;
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:pagevc];
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
