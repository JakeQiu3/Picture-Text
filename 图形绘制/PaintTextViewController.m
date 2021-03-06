//
//  ViewController.m
//  Model
//
//  Created by qsyMac on 16/1/22.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "PaintTextViewController.h"

@interface PaintTextViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableArray *_fileNameArray;
    NSMutableArray *_titileArray;
}

@end

@implementation PaintTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setUI];
}

- (void)loadData {
    _fileNameArray = @[@"绘制文字1",@"绘制文字2(重点)",@"绘制内容到pdf"].mutableCopy;
    _titileArray = @[@"BViewController",@"CViewController",@"DViewController"].mutableCopy;
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
