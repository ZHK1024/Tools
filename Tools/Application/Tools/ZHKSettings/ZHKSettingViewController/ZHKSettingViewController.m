//
//  ZHKSettingViewController.m
//  Tools
//
//  Created by ZHK on 2018/4/18.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import "ZHKSettingViewController.h"
#import <Masonry.h>
#import "ZHKSettingListCell.h"
#import "ZHKSettingDescriptionCell.h"
#import "ZHKSettingHeaderView.h"
#import "Header.h"

@interface ZHKSettingViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ZHKSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UI

- (void)createUI {
    self.title = @"设置";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

FUN_scaleX

#pragma mark - UITableView dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ZHKSettingDescriptionCell *cell = [tableView dequeueReusableCellWithIdentifier:ZHKSettingDescriptionCell_INDEF];
        return cell;
    }
    ZHKSettingListCell *cell = [tableView dequeueReusableCellWithIdentifier:ZHKSettingListCell_INDEF];
    return cell;
}

#pragma mark - UITableView delegate

// row select
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//// row heighr
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 44.0;
//}

//// header footer height
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 50.0;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

// view for header footer
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZHKSettingHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ZHKSettingHeaderView_INDEF];
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

#pragma mark - Getter

- (UITableView *)tableView {
    if (_tableView == nil) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 44.0f;
        _tableView.sectionHeaderHeight = 50.0f * [self scaleX];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
    
        // cells
        [_tableView registerClass:[ZHKSettingListCell class] forCellReuseIdentifier:ZHKSettingListCell_INDEF];
        [_tableView registerClass:[ZHKSettingDescriptionCell class] forCellReuseIdentifier:ZHKSettingDescriptionCell_INDEF];
        // header
        [_tableView registerClass:[ZHKSettingHeaderView class] forHeaderFooterViewReuseIdentifier:ZHKSettingHeaderView_INDEF];
    }
    return _tableView;
}



@end
