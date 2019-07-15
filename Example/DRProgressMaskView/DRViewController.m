//
//  DRViewController.m
//  DRProgressMaskView
//
//  Created by Dean_F on 07/14/2019.
//  Copyright (c) 2019 Dean_F. All rights reserved.
//

#import "DRViewController.h"
#import <DRProgressMaskView/DRProgressMaskView.h>

@interface DRViewController ()

@property (weak, nonatomic) IBOutlet DRProgressMaskView *progressView;
@property (weak, nonatomic) IBOutlet UIStepper *checkSteper;
@property (weak, nonatomic) IBOutlet UIStepper *totalSteper;
@property (weak, nonatomic) IBOutlet UIStepper *maxSteper;
@property (weak, nonatomic) IBOutlet UILabel *checkLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxLabel;

@end

@implementation DRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.totalSteper.value = 6;
    self.checkSteper.value = 1;
    self.maxSteper.value = 10;
    [self refresh];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refresh {
    self.progressView.maxNumberOfMask = (NSInteger)self.maxSteper.value;
    [self.progressView refreshWithTotalCheck:self.totalSteper.value
                                 finishCheck:self.checkSteper.value
                                    progress:self.checkSteper.value / self.totalSteper.value];
    self.checkLabel.text = [NSString stringWithFormat:@"完成：%ld", (NSInteger)self.checkSteper.value];
    self.totalLabel.text = [NSString stringWithFormat:@"总数：%ld", (NSInteger)self.totalSteper.value];
    self.maxLabel.text = [NSString stringWithFormat:@"阈值：%ld", (NSInteger)self.maxSteper.value];
}

- (IBAction)steperChange:(UIStepper *)sender {
    if (sender == self.checkSteper) {
        if (self.checkSteper.value > self.totalSteper.value) {
            self.checkSteper.value = self.totalSteper.value;
        }
    }
    if (sender == self.totalSteper || sender == self.maxSteper) {
        if (sender.value <= 1) {
            sender.value = 1;
        }
    }
    [self refresh];
}


@end
