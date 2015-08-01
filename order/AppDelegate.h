//
//  AppDelegate.h
//  order
//
//  Created by 王王 on 15/7/24.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LoginViewController *loginVC;
@property (strong,nonatomic) UINavigationController *rootnav;
@property (strong,nonatomic) UITabBarController *tvc;

//@property (strong, nonatomic) UITabBarController *tvc;

@end

