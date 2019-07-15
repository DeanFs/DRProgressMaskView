//
//  DRColorProgressView.h
//  Records
//
//  Created by DuoRong on 2018/10/30.
//  Copyright © 2018年 DuoRong Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
    颜色进度控件
 */
@interface DRColorProgressView : UIView

/*
 进度的背景色
 */
@property (nonatomic, strong) UIColor *bgColor;

/*
 进度条的颜色
 */
@property (nonatomic, strong) UIColor *progressColor;

/*
 进度值
 */
@property (nonatomic, assign) CGFloat progressValue;
@end
