//
//  PushViewController.m
//  navigationControllerPush
//
//  Created by lujh on 2017/7/11.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "PushViewController.h"
#import "FriendViewController.h"
@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setNavigationBarTitle:@"push"];
    
    // push按钮
    CGFloat X = (self.view.frame.size.width - 150)/2.0;
    UIButton *pushBtn = [[UIButton alloc] init];
    pushBtn.frame = CGRectMake(X, 300, 150, 50);
    pushBtn.backgroundColor = [UIColor redColor];
    [pushBtn setTitle:@"push好友VC" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(pushBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
    
}

- (void)pushBtnClick
{
    FriendViewController *VC = [[FriendViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
