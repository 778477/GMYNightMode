//
//  MainViewController.m
//  GMYNightModeTest
//
//  Created by miaoyou.gmy on 16/4/18.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import "MainViewController.h"
#import "TableViewController.h"
#import "GMYThemeManager.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (IBAction)tapChange:(id)sender {
    GMYTheme theme = [GMYThemeManager shareThemeManager].currentTheme;
    [[GMYThemeManager shareThemeManager] changeTheme:!theme];
}

- (IBAction)pushTableView:(id)sender {
    [self.navigationController pushViewController:[TableViewController new] animated:YES];
}

@end
