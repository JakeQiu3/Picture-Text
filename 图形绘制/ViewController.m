//
//  ViewController.m
//  图形绘制
//
//  Created by 邱少依 on 16/1/4.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "ViewController.h"
#import "KCView.h"
@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    KCView *_view;
    NSArray *_fontSizeArray;
}
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    [self addUI];//添加绘制的UI
//    [self initLayout];
//    [self addPickerView];//添加刷新
//    [self addImage];//添加水印
    [self drawContentToPdfContext];//测试4：绘制内容到pdf
    // Do any additional setup after loading the view, typically from a nib.
}
//测试1：绘制的视图
- (void)addUI {
    KCView *view = [[KCView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}

//测试2：绘制的内容，刷新
- (void)initLayout {
    _fontSizeArray = @[@15,@18,@25,@27,@32,@48];//字体数组
    _view = [[KCView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _view.backgroundColor = [UIColor greenColor];
    _view.title = @"每个个性都值得绽放";
    _view.fontSize = [_fontSizeArray[0] intValue];
    [self.view addSubview:_view];
}

//测试3：绘制的内容，添加水印
- (void)addImage {
    UIImage *image=[self drawImageAtImageContext];
    UIImageView *imageView=[[UIImageView alloc]initWithImage:image];
    imageView.center=CGPointMake(160, 284);
    
    [self.view addSubview:imageView];
}
//测试4：绘制内容到pdf
- (void)drawContentToPdfContext {
//    沙盒路径
    NSArray *fileArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [fileArray firstObject];
    NSString *fileStr = [path stringByAppendingPathComponent:@"myPdf.pdf"];
    UIGraphicsBeginPDFContextToFile(fileStr, CGRectZero, [NSDictionary dictionaryWithObjectsAndKeys:@"qsy",kCGPDFContextAuthor, nil]);
    //由于pdf文档是分页的，所以首先要创建一页画布供我们绘制
    UIGraphicsBeginPDFPage();
    
    NSString *title=@"Welcome to Apple Support";
    NSMutableParagraphStyle *style=[[NSMutableParagraphStyle alloc]init];
    NSTextAlignment align=NSTextAlignmentCenter;
    style.alignment=align;
    [title drawInRect:CGRectMake(26, 20, 300, 50) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSParagraphStyleAttributeName:style}];
    NSString *content=@"Learn about Apple products, view online manuals, get the latest downloads, and more. Connect with other Apple users, or get service, support, and professional advice from Apple.";
    NSMutableParagraphStyle *style2=[[NSMutableParagraphStyle alloc]init];
    style2.alignment=NSTextAlignmentLeft;
    //    style2.firstLineHeadIndent=20;
    [content drawInRect:CGRectMake(26, 56, 300, 255) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor grayColor],NSParagraphStyleAttributeName:style2}];
    
    UIImage *image=[UIImage imageNamed:@"applecare_folks_tall.png"];
    [image drawInRect:CGRectMake(316, 20, 290, 305)];
    
    UIImage *image2=[UIImage imageNamed:@"applecare_page1.png"];
    [image2 drawInRect:CGRectMake(6, 320, 600, 281)];
    
    //创建新的一页继续绘制其他内容
    UIGraphicsBeginPDFPage();
    UIImage *image3=[UIImage imageNamed:@"applecare_page2.png"];
    [image3 drawInRect:CGRectMake(6, 20, 600, 629)];
    
    //结束pdf上下文
    UIGraphicsEndPDFContext();
}
#pragma mark 利用位图上下文添加水印效果
-(UIImage *)drawImageAtImageContext{
    //获得一个位图图形上下文
    CGSize size=CGSizeMake(300, 188);//画布大小
    UIGraphicsBeginImageContext(size);
    
    UIImage *image=[UIImage imageNamed:@"0-启动页-1.jpg"];
    [image drawInRect:CGRectMake(0, 0, 300, 188)];//注意绘图的位置是相对于画布顶点而言，不是屏幕
    
    //添加水印
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 200, 178);
    CGContextAddLineToPoint(context, 270, 178);
    
    [[UIColor redColor]setStroke];
    CGContextSetLineWidth(context, 2);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    NSString *str=@"Shaoyi Qui";
    [str drawInRect:CGRectMake(200, 158, 100, 30) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Marker Felt" size:15],NSForegroundColorAttributeName:[UIColor redColor]}];
    
    //返回绘制的新图形
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    
    //最后一定不要忘记关闭对应的上下文
    UIGraphicsEndImageContext();
    
    //保存图片
    NSData *data= UIImagePNGRepresentation(newImage);
    [data writeToFile:@"/Users/qiushaoyi/Desktop/guomaozuixin.png" atomically:YES];
    
    return newImage;
}

- (void)addPickerView {
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 200, 0,0)];
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
    [_view setNeedsDisplay];//刷新绘制的内容视图：可以间接调用drawRect
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
