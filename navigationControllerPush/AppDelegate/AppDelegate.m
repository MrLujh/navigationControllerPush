//
//  AppDelegate.m
//  navigationControllerPush
//
//  Created by lujh on 2017/7/11.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "AppDelegate.h"
#import "GuidePageManager.h"

@interface AppDelegate ()<GuidePageDelegate>
// tabBarViewController
@property (nonatomic, strong) TabBarViewController *tabBarViewController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.tabBarViewController = [[TabBarViewController alloc] init];
    self.window.rootViewController = self.tabBarViewController;
    [self.window makeKeyAndVisible];
    
    
    // 添加引导页
    NSArray *imageArray = [[NSArray alloc] init];
    if (BottomSafty == 0) {
        
        imageArray = @[@"guide_page_image_0",@"guide_page_image_1", @"guide_page_image_2", @"guide_page_image_3", @"guide_page_image_4"];
    }else {
        
        imageArray = @[@"guide_page_image_iphoex_0",@"guide_page_image_iphoex_1", @"guide_page_image_iphoex_2", @"guide_page_image_iphoex_3"];
    }
    
    // 体验 按钮
    CGRect ret;
    if (BottomSafty == 0) {
        
        ret = CGRectMake((KUIScreenWidth -140*kScaleW)/2.0, KUIScreenHeight -60*kScaleH, 140*kScaleW, 50);
    }else {
        
        ret = CGRectMake((KUIScreenWidth -140*kScaleW)/2.0, KUIScreenHeight -110*kScaleH, 140*kScaleW, 50);
    }
    
    [GuidePageManager shareManagerWithDelegate:self imageArray:imageArray startBtnFrame:ret isShowBtnBackgroundColor:YES];
    
    
    // 显示小红点
    [self showUnreadMessageHotView];
    
    return YES;
}

#pragma mark -显示小红点

- (void)showUnreadMessageHotView {
    
    //显示小红点
    [self.tabBarViewController.tabBar showBadgeOnItemIndex:4];
    
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
