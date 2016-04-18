//
//  TableViewController.m
//  GMYNightModeTest
//
//  Created by miaoyou.gmy on 16/4/16.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import "TableViewController.h"
#import "GMYThemeManager.h"
#import "GMYThemeColorPickers.h"
#import "UIView+GMYTheme.h"
#import "UILabel+GMYTheme.h"
#import "UIBarButtonItem+GMYTheme.h"

NSString const * reuseIdentifier = @"com.apple.UIKit.UITableViewCell";

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.clearsSelectionOnViewWillAppear = NO;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:[reuseIdentifier copy]];
    
    
    UILabel *navigationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 44)];
    navigationLabel.text = @"GMYNightModeTest";
    navigationLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = navigationLabel;
    navigationLabel.gmy_TextColorPicker = GMYPickerWithColor([UIColor blackColor], [UIColor whiteColor]);
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"change" style:UIBarButtonItemStylePlain target:self action:@selector(change:)];
    self.navigationItem.rightBarButtonItem = item;
    self.navigationItem.rightBarButtonItem.gmy_tintColorPicker = GMYPickerWithColor([UIColor blackColor], [UIColor whiteColor]);
     self.navigationItem.leftBarButtonItem.gmy_tintColorPicker = GMYPickerWithColor([UIColor blackColor], [UIColor whiteColor]);
    self.tableView.gmy_backGroundColorPicker = GMYPickerWithRGB(0xffffff,0x343434);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.gmy_tintColorPicker = GMYPickerWithRGB(0xffffff,0x343434);
}


- (void)dealloc{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[reuseIdentifier copy] forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld:this's a long test Text",indexPath.row];
    cell.textLabel.gmy_TextColorPicker = GMYPickerWithColor([UIColor blackColor], [UIColor grayColor]);
    cell.textLabel.gmy_backGroundColorPicker = GMYPickerWithRGB(0xffffff,0x343434);
    
    cell.contentView.gmy_backGroundColorPicker = GMYPickerWithRGB(0xffffff,0x343434);
    return cell;
}

#pragma mark -
- (void)change:(id)sender{
    if([GMYThemeManager shareThemeManager].currentTheme == GMYLightDayTheme){
        [[GMYThemeManager shareThemeManager] changeTheme:GMYMoonNightTheme];
    }
    else{
        [[GMYThemeManager shareThemeManager] changeTheme:GMYLightDayTheme];
    }
}


@end
