//
//  ViewController.m
//  图形绘制
//
//  Created by 邱少依 on 16/1/4.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@end


@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addImage];//添加水印图片和文字
}

//测试3：绘制的内容，添加水印
- (void)addImage {
    UIImage *image=[self drawImageAtImageContext];
    UIImageView *imageView=[[UIImageView alloc]initWithImage:image];
    imageView.center=CGPointMake(160, 284);
    
    [self.view addSubview:imageView];
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
    
    NSString *str=@"Shaoyi Qiu,我爱你";
    [str drawInRect:CGRectMake(100, 158, 100, 30) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Marker Felt" size:15],NSForegroundColorAttributeName:[UIColor redColor]}];
    
    //返回绘制的新图形
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    
    //最后一定不要忘记关闭对应的上下文
    UIGraphicsEndImageContext();
    
    //保存图片：电脑或沙盒
    NSData *data= UIImagePNGRepresentation(newImage);
    [data writeToFile:@"/Users/qiushaoyi/Desktop/guomaozuixin.png" atomically:YES];
    return newImage;
}

@end
