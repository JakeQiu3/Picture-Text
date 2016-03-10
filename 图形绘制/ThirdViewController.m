//
//  ThirdViewController.m
//  图形绘制
//
//  Created by qsyMac on 16/3/4.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "ThirdViewController.h"
#import "ThirdView.h"
@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addUI];
}

- (void)addUI {
    ThirdView *view = [[ThirdView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64)];
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
