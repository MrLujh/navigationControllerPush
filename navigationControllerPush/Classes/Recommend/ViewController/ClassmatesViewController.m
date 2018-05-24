//
//  ClassmatesViewController.m
//  navigationControllerPush
//
//  Created by lujh on 2017/7/12.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "ClassmatesViewController.h"
#import "FriendViewController.h"
@interface ClassmatesViewController ()

@end

@implementation ClassmatesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBarTitle:@"同学"];
    
    // push按钮
    CGFloat X = (self.view.frame.size.width - 100)/2.0;
    UIButton *pushBtn = [[UIButton alloc] init];
    pushBtn.frame = CGRectMake(X, 300, 100, 50);
    pushBtn.backgroundColor = [UIColor redColor];
    [pushBtn setTitle:@"返回推荐VC" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(pushBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
    
    
    // present按钮
    UIButton *presentBtn = [[UIButton alloc] init];
    presentBtn.frame = CGRectMake(X, 400, 100, 50);
    presentBtn.backgroundColor = [UIColor redColor];
    [presentBtn setTitle:@"返回好友VC" forState:UIControlStateNormal];
    [presentBtn addTarget:self action:@selector(presentBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentBtn];
}

- (void)pushBtnClick
{
    // 返回保险首页
    NSArray * array = self.navigationController.viewControllers;
    UIViewController *targetVC ;
    
    for (UIViewController *viewController in array) {
        if ([viewController isMemberOfClass:NSClassFromString(@"PushViewController")]) {
            
            self.tabBarController.selectedIndex = 1;
            [self.navigationController popToRootViewControllerAnimated:NO];
            break;
        }
    }
    
    for (UIViewController *viewController in array) {
        if ([viewController isMemberOfClass:NSClassFromString(@"RecommendViewController")]) {
            targetVC = viewController;
            break;
        }
    }
    if (targetVC) {
        [self.navigationController popToViewController:targetVC animated:YES];
    }
}

- (void)presentBtnClick
{
    // 返回已回访保单
    NSArray * array = self.navigationController.viewControllers;
    UIViewController *targetVC ;
    
    for (UIViewController *viewController in array) {
        
        if ([viewController isMemberOfClass:NSClassFromString(@"PushViewController")]) {
            
            UINavigationController *viewController  = [self.tabBarController.viewControllers objectAtIndex:1];
            FriendViewController *nextController= [[FriendViewController alloc]init];
            [viewController pushViewController:nextController animated:NO];
            self.tabBarController.selectedIndex = 1;
            [self.navigationController popToRootViewControllerAnimated:NO];
            
            break;
        }
        
        if ([viewController isMemberOfClass:NSClassFromString(@"FriendViewController")]) {
            targetVC = viewController;
            break;
        }
    }
    
    if (targetVC) {
    
        [self.navigationController popToViewController:targetVC animated:YES];
    }
}

@end
