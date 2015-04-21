//
//  HomeViewController.m
//  thNet
//
//  Created by KID on 15/4/21.
//  Copyright (c) 2015年 KID. All rights reserved.
//

#import "HomeViewController.h"
#import "RTabBarViewController.h"
#import "REngine.h"
#import "XEProgressHUD.h"
#import "XEScrollPage.h"
#import "XECollectionViewCell.h"

@interface HomeViewController ()<XEScrollPageDelegate, UICollectionViewDataSource, UICollectionViewDelegate>{
    
}

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.collectionView registerClass:[XECollectionViewCell class] forCellWithReuseIdentifier:@"XECollectionViewCell"];
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

- (BOOL)isVisitor{
    if (![[REngine shareInstance] hasAccoutLoggedin]) {
        return YES;
    }
    return NO;
}





- (void)loginAction{
    
}

@end
