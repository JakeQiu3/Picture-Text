//
//  DViewController.m
//  图形绘制
//
//  Created by qsyMac on 16/3/11.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "DViewController.h"

@interface DViewController ()

@end

@implementation DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawContentToPdfContext];//测试4：绘制内容到pdf
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
