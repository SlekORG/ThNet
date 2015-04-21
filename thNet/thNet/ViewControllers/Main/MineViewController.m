//
//  MineViewController.m
//  thNet
//
//  Created by KID on 15/4/21.
//  Copyright (c) 2015年 KID. All rights reserved.
//

#import "MineViewController.h"
#import "RTabBarViewController.h"
#import "XEProgressHUD.h"
#import "REngine.h"
#import "RAlertView.h"
#import "RNavigationController.h"
#import "LoginViewController.h"
#import "XEActionSheet.h"

@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *moreDataSource;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _moreDataSource = [[NSMutableArray alloc] init];
    [_moreDataSource addObject:@"个人信息"];
    [_moreDataSource addObject:@"我的订单"];
    [_moreDataSource addObject:@"生成邀请码"];
//    if ([REngine shareInstance].uid) {
        [_moreDataSource addObject:@"用户退出"];
//    }
    [self.tableView reloadData];
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = view;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNormalTitleNavBarSubviews{
    [self setTitle:@"我的信息"];
}

- (UINavigationController *)navigationController{
    if ([super navigationController]) {
        return [super navigationController];
    }
    return self.tabController.navigationController;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 30)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _moreDataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    cell.textLabel.text = _moreDataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath* selIndexPath = [tableView indexPathForSelectedRow];
    [tableView deselectRowAtIndexPath:selIndexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
//            RAlertView *alertView = [[RAlertView alloc] initWithTitle:@"联系我们" message:@"18606501408" cancelButtonTitle:@"取消" cancelBlock:nil okButtonTitle:@"呼叫" okBlock:^{
//                NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", @"18606501408"]];
//                [[UIApplication sharedApplication] openURL:URL];
//            }];
//            [alertView show];
        }
            break;
        case 1:
        {
//            [self checkVersion];
        }
            break;
            
        case 2:
        {
            //            [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=610391034"]];
//            RAlertView *alert = [[RAlertView alloc] initWithTitle:@"小贴士" message:@"项目还未上架,请耐心等待" cancelButtonTitle:@"确定"];
//            [alert show];
        }
            break;
        case 3:
        {
            XEActionSheet *sheet = [[XEActionSheet alloc] initWithTitle:nil actionBlock:^(NSInteger buttonIndex) {
                if (buttonIndex == 1) {
                    return;
                }
                if (buttonIndex == 0) {
                    [[REngine shareInstance] visitorLogin];
                    LoginViewController *loginVc = [[LoginViewController alloc] init];
                    RNavigationController* navigationController = [[RNavigationController alloc] initWithRootViewController:loginVc];
                    navigationController.navigationBarHidden = YES;
                    [self.navigationController presentViewController:navigationController animated:YES completion:nil];
                }
            }];
            [sheet addButtonWithTitle:@"退出登录"];
            sheet.destructiveButtonIndex = sheet.numberOfButtons - 1;
            
            [sheet addButtonWithTitle:@"取消"];
            sheet.cancelButtonIndex = sheet.numberOfButtons -1;
            [sheet showInView:self.view];
        }
            break;
        default:
            break;
    }
}

@end
