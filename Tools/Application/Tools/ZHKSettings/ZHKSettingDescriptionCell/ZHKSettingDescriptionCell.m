//
//  ZHKSettingDescriptionCell.m
//  Tools
//
//  Created by ZHK on 2018/4/18.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import "ZHKSettingDescriptionCell.h"
#import <Masonry.h>
#import "Header.h"

NSString *const ZHKSettingDescriptionCell_INDEF = @"ZHKSettingDescriptionCell";

@interface ZHKSettingDescriptionCell ()

@property (nonatomic, strong) UILabel *explainLabel;
@property (nonatomic, strong) UIView  *underLine;

@end

@implementation ZHKSettingDescriptionCell

#pragma mark - Init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

#pragma mark - UI

- (void)createUI {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    CGFloat scale_x = [self scaleX];
    
    [self.contentView addSubview:self.explainLabel];
    [self.contentView addSubview:self.underLine];
    
    CGFloat gap = 15.0f * scale_x;
    [_explainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, gap, gap, gap));
    }];
    
    [_underLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(gap);
        make.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(1.0f);
    }];
    
    _explainLabel.text = @"描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述";
}

FUN_scaleX

#pragma mark - Getter

- (UILabel *)explainLabel {
    if (_explainLabel == nil) {
        self.explainLabel = [UILabel new];
        _explainLabel.font = [UIFont systemFontOfSize:12.0f * [self scaleX]];
        _explainLabel.textColor = COLOR(190, 190, 190, 1);
        _explainLabel.numberOfLines = 0;
    }
    return _explainLabel;
}

- (UIView *)underLine {
    if (_underLine == nil) {
        self.underLine = [UIView new];
        _underLine.backgroundColor = COLOR(240, 240, 240, 1);
    }
    return _underLine;
}

@end
