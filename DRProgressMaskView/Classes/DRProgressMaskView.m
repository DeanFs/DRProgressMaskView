//
//  DRProgressMaskView.m
//  Records
//
//  Created by 戴俊鹏 on 2018/11/1.
//  Copyright © 2018年 DuoRong Technology Co., Ltd. All rights reserved.
//

#import "DRProgressMaskView.h"
#import "DRColorProgressView.h"
#import <DRCategories/UIView+DRExtension.h>

@interface DRProgressMaskView ()

@property (nonatomic, strong) DRColorProgressView *progressView;
@property (nonatomic, strong) UIStackView *stackProgressView;

@end


@implementation DRProgressMaskView

- (instancetype)initWithFrame:(CGRect)frame
            progressTintColor:(UIColor *)progressTintColor
               trackTintColor:(UIColor*)trackTintColor
              maxNumberOfMask:(NSInteger)maxNumberOfMask {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.maxNumberOfMask = maxNumberOfMask;
        self.trackTintColor = trackTintColor;
        self.progressTintColor = progressTintColor;
        
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    DRColorProgressView *progressView = [[DRColorProgressView alloc] init];
    
    [self addSubview:progressView];
    self.progressView = progressView;
    
    UIView *stackContainerView = [[UIView alloc] init];
    stackContainerView.backgroundColor = [UIColor whiteColor];
    stackContainerView.layer.masksToBounds = YES;
    [self addSubview:stackContainerView];
    
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.spacing = 1.0;
    [stackContainerView addSubview:stackView];
    self.stackProgressView = stackView;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    self.progressView.bgColor = self.trackTintColor;
    self.progressView.progressColor = self.progressTintColor;
    self.progressView.frame = self.bounds;
    
    self.stackProgressView.superview.frame = self.bounds;
    self.stackProgressView.frame = self.bounds;
    self.stackProgressView.superview.layer.cornerRadius = self.height / 2;
}

- (void)refreshWithTotalCheck:(NSInteger)totalCheck
                  finishCheck:(NSInteger)finishCheck
                     progress:(CGFloat)progress {
    if (totalCheck > self.maxNumberOfMask) {
        self.stackProgressView.superview.hidden = YES;
        self.progressView.hidden = NO;
        self.progressView.progressValue = progress;
    } else {
        self.stackProgressView.superview.hidden = NO;
        self.progressView.hidden = YES;
        [self setupStackProgressWithTotalCheck:totalCheck finishCheck:finishCheck];
    }
}

- (void)setupStackProgressWithTotalCheck:(NSInteger)totalCheck finishCheck:(NSInteger)finishCheck {
    for (UIView *view in self.stackProgressView.arrangedSubviews) {
        [self.stackProgressView removeArrangedSubview:view];
    }
    
    for (NSInteger i=0; i<totalCheck; i++) {
        UIView *view = [[UIView alloc] init];
        if (i < finishCheck) {
            view.backgroundColor = self.progressTintColor;
        } else {
            view.backgroundColor = self.trackTintColor;
        }
        [self.stackProgressView addArrangedSubview:view];
    }
}

@end
