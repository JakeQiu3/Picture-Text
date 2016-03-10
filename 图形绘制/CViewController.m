//
//  CViewController.m
//  图形绘制
//
//  Created by qsyMac on 16/3/10.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "CViewController.h"
#import "CView.h"
@interface CViewController ()
{
    NSArray *_fontSizeArray;
    CView *_view;
}
@end

@implementation CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLayout];
}
//测试2：绘制的内容，刷新
- (void)initLayout {
    _fontSizeArray = @[@15,@18,@25,@27,@32,@48];//字体数组
    _view = [[CView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _view.backgroundColor = [UIColor lightTextColor];
    _view.title = @"每个个性都值得绽放,个性才是一切发展的根本，而不是趋同";
    _view.fontSize = [_fontSizeArray[5] intValue];
    [self.view addSubview:_view];
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
