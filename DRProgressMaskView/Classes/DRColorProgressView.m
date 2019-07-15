//
//  DRColorProgressView.m
//  Records
//
//  Created by DuoRong on 2018/10/30.
//  Copyright © 2018年 DuoRong Technology Co., Ltd. All rights reserved.
//

#import "DRColorProgressView.h"
#import <DRCategories/UIView+DRExtension.h>

@interface DRColorProgressView ()

/*
 进度背景颜色控件, 默认圆角
 */
@property (nonatomic, strong) UIView *bgView;

/*
 进度颜色控件, 默认圆角
 */
@property (nonatomic, strong) UIView *progressView;
@end

@implementation DRColorProgressView

- (id)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self addSubview:self.bgView];
        [self addSubview:self.progressView];
        
        /*
         边边圆形的情况
         */
        self.progressView.layer.cornerRadius = frame.size.height / 2.0;
        self.bgView.layer.cornerRadius = frame.size.height / 2.0;
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self addSubview:self.bgView];
    [self addSubview:self.progressView];
    
    /*
     边边圆形的情况
     */
    self.progressView.layer.cornerRadius = self.height / 2.0;
    self.bgView.layer.cornerRadius = self.height / 2.0;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    self.progressView.layer.cornerRadius = frame.size.height / 2.0;
    self.bgView.layer.cornerRadius = frame.size.height / 2.0;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    /*
     同步更新控件显示范围
     */
    self.progressView.frame = CGRectMake(0, 0,
                                         self.width * self.progressValue, self.height);
    self.bgView.frame = self.bounds;
    
    /*
     同步更新边边圆形的情况
     */
    self.progressView.layer.cornerRadius = self.height / 2.0;
    self.bgView.layer.cornerRadius = self.height / 2.0;
}

/*
 设置背景颜色
 */
- (void)setBgColor:(UIColor *)bgColor {
    self.bgView.backgroundColor = bgColor;
}

/*
 设置进度颜色
 */
- (void)setProgressColor:(UIColor *)progressColor {
    self.progressView.backgroundColor = progressColor;
}

/*
 设置进度值
 */
- (void)setProgressValue:(CGFloat)progressValue {
    _progressValue = progressValue;
    self.progressView.frame = CGRectMake(0, 0, self.width * progressValue, self.height);
}

- (UIView *)bgView {
    if(_bgView == nil) {
        _bgView = [[UIView alloc] initWithFrame:self.bounds];
        _bgView.layer.masksToBounds = true;
    }
    
    return _bgView;
}

- (UIView *)progressView {
    if(_progressView == nil) {
        _progressView = [[UIView alloc] initWithFrame:self.bounds];
        _progressView.layer.masksToBounds = true;
    }
    
    return _progressView;
}

@end
