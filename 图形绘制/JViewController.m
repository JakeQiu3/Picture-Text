//
//  JViewController.m
//  图形绘制
//
//  Created by qsyMac on 16/3/11.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "JViewController.h"
#import "JView.h"
@interface JViewController ()

@end

@implementation JViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addUI];
    // Do any additional setup after loading the view.
}

- (void)addUI {
    JView *view = [[JView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64)];
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
