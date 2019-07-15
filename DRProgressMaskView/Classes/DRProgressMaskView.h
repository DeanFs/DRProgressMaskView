//
//  DRProgressMaskView.h
//  Records
//
//  Created by 戴俊鹏 on 2018/11/1.
//  Copyright © 2018年 DuoRong Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRProgressMaskView : UIView

@property (nonatomic, assign) IBInspectable NSInteger maxNumberOfMask;
@property (nonatomic, strong) IBInspectable UIColor *trackTintColor;
@property (nonatomic, strong) IBInspectable UIColor *progressTintColor;

- (instancetype)initWithFrame:(CGRect)frame
            progressTintColor:(UIColor *)progressTintColor
               trackTintColor:(UIColor*)trackTintColor
              maxNumberOfMask:(NSInteger)maxNumberOfMask;

- (void)refreshWithTotalCheck:(NSInteger)totalCheck
                  finishCheck:(NSInteger)finishCheck
                     progress:(CGFloat)progress;

@end
