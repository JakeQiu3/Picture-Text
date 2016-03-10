//
//  ViewController.m
//  Model
//
//  Created by qsyMac on 16/1/22.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "PaintGraphViewController.h"

@interface PaintGraphViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableArray *_fileNameArray;
    NSMutableArray *_titileArray;
}

@end

@implementation PaintGraphViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setUI];
}

- (void)loadData {
    _fileNameArray = @[@"绘制三角形和矩形",@"绘制图片",@" 线条杂乱的线条",@"图文混排（重点）",@"选择拾取器（重点）",@"绘制椭圆等弯曲图形",@"颜色渐变（径向和线向）",@"花石雕刻形"].mutableCopy;
    _titileArray = @[@"AViewController",@"EViewController",@"FViewController",@"FirstViewController",@"SecondViewController",@"ThirdViewController",@"KViewController",@"JViewController"].mutableCopy;
}

- (void)setUI {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
    _tableView.rowHeight = 50;
    _tableView.showsVerticalScrollIndicator = YES;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.separatorColor = [UIColor blackColor];
    [self.view addSubview:_tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titileArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *qsyIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:qsyIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:qsyIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@" %ld: %@",(long)indexPath.row,_fileNameArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class cls;
    //    不同类型(特指出结构体类型)和字符串之间转换
    cls = NSClassFromString(_titileArray[indexPath.row]);
    UIViewController *viewC = [[cls alloc] init];
    [self.navigationController pushViewController:viewC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
