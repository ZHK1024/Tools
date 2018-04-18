//
//  ZHKSettingHeaderView.m
//  Tools
//
//  Created by ZHK on 2018/4/18.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import "ZHKSettingHeaderView.h"
#import <Masonry.h>
#import "Header.h"

NSString *const ZHKSettingHeaderView_INDEF = @"ZHKSettingHeaderView";

@interface ZHKSettingHeaderView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ZHKSettingHeaderView

#pragma mark - Init

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

#pragma mark - UI

- (void)createUI {
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    CGFloat scale_x = [self scaleX];
    
    [self.contentView addSubview:self.titleLabel];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 15.0f * scale_x, 0, 15.0f * scale_x));
    }];
    
    _titleLabel.text = @"备份";
}

FUN_scaleX

#pragma mark - Getter

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        self.titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:15.0f * [self scaleX]];
    }
    return _titleLabel;
}

@end
