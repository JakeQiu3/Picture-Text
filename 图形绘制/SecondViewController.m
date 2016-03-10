//
//  SecondViewController.m
//  图形绘制
//
//  Created by qsyMac on 16/3/4.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "SecondViewController.h"
#import "CView.h"
@interface SecondViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    CView *_view;
    NSArray *_fontSizeArray;//数据源
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLayout];
    [self addPickerView];//添加刷新

}

//测试2：绘制内容
- (void)initLayout {
    _fontSizeArray = @[@15,@18,@25,@27,@32,@48];//字体数组
    _view = [[CView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _view.backgroundColor = [UIColor lightTextColor];
    _view.title = @"每个个性都值得绽放,个性才是一切发展的根本，而不是趋同";
    _view.fontSize = [_fontSizeArray[5] intValue];
    [self.view addSubview:_view];
}

- (void)addPickerView {
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 400, 0,0)];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    [self.view addSubview:pickerView];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _fontSizeArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%@号字体",_fontSizeArray[row]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _view.fontSize = [_fontSizeArray[row] intValue];
    //刷新绘制的内容视图：可以间接调用drawRect
    [_view setNeedsDisplay];
}

@end
