//
//  KViewController.m
//  图形绘制
//
//  Created by qsyMac on 16/3/11.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "KViewController.h"
#import "KCView.h"
@interface KViewController ()

@end

@implementation KViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addUI];
}

//测试1：绘制的视图
- (void)addUI {
    KCView *view = [[KCView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
