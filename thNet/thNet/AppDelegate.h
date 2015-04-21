//
//  AppDelegate.h
//  thNet
//
//  Created by KID on 15/4/20.
//  Copyright (c) 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTabBarViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readwrite, nonatomic) RTabBarViewController* mainTabViewController;
@property (strong, nonatomic) UIMenuController *appMenu;

- (void)signIn;
- (void)signOut;

@end

