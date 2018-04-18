//
//  ZHKSettingListCell.m
//  Tools
//
//  Created by ZHK on 2018/4/18.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import "ZHKSettingListCell.h"
#import <Masonry.h>
#import "Header.h"

NSString *const ZHKSettingListCell_INDEF = @"ZHKSettingListCell";

@interface ZHKSettingListCell ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UILabel     *explainLabel;

@end

@implementation ZHKSettingListCell

#pragma mark - Init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

#pragma mark - UI

- (void)createUI {
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.explainLabel];
    
    CGFloat scale_x = [self scaleX];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(15.0f * scale_x);
        make.bottom.mas_equalTo(-15.0f * scale_x);
        make.size.mas_equalTo(CGSizeMake(20.0f * scale_x, 20.0f * scale_x));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(_iconView);
        make.left.equalTo(_iconView.mas_right).offset(10.0f * scale_x);
        make.right.equalTo(_explainLabel.mas_left).offset(-15.0f * scale_x);
    }];

    [_explainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(_iconView);
        make.right.mas_equalTo(-10.0f * scale_x);
        make.width.mas_greaterThanOrEqualTo(0.0f);
    }];
    
    _iconView.backgroundColor = DEBUG_COLOR;
    _titleLabel.text = @"iCloud自动备份";
    _explainLabel.text = @"30秒前";
}

FUN_scaleX

#pragma mark - Getter

- (UIImageView *)iconView {
    if (_iconView == nil) {
        self.iconView = [UIImageView new];
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        self.titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:17.0f * [self scaleX]];
        _titleLabel.textColor = COLOR(61, 61, 61, 1);
    }
    return _titleLabel;
}

- (UILabel *)explainLabel {
    if (_explainLabel == nil) {
        self.explainLabel = [UILabel new];
        _explainLabel.font = [UIFont systemFontOfSize:12.0f * [self scaleX]];
        _explainLabel.textColor = COLOR(161, 161, 161, 1);
    }
    return _explainLabel;
}

@end
