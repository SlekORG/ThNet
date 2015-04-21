//
//  HomeViewController.m
//  thNet
//
//  Created by KID on 15/4/21.
//  Copyright (c) 2015年 KID. All rights reserved.
//

#import "HomeViewController.h"
#import "REngine.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNormalTitleNavBarSubviews{
    [self setTitle:@"精品"];
    if (![REngine shareInstance].uid) {
        [self setRightButtonWithTitle:@"登录" selector:@selector(loginAction)];
    }
}

- (void)loginAction{
    
}

@end
