//
//  EView.m
//  图形绘制
//
//  Created by qsyMac on 16/3/10.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "EView.h"

@implementation EView


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
     [self drawImage:context];//绘制图像1
    [self drawImageView:context];//绘制图像2
}

#pragma mark 绘制图像
-(void)drawImage:(CGContextRef)context {
    //  测试1：图像移动缩放和变形
    UIImage *image  = [UIImage imageNamed:@"0-启动页-1.jpg"];
    CGContextSaveGState(context);//保存初始状态
    CGContextTranslateCTM(context, 100, 0); //形变第一步：向右平移40
    CGContextScaleCTM(context, 0.8, 0.8);//形变第二步：缩放0.8
    CGContextRotateCTM(context, -M_PI_4);////形变第三步：旋转
    [image drawInRect:CGRectMake(0, 50, 240, 300)];
    
    CGContextRestoreGState(context); //恢复到初始状态
    
}

- (void)drawImageView:(CGContextRef)context {
    //  测试2：图像倒置
    UIImage *image2 = [UIImage imageNamed:@"0-启动页-1.jpg"];
    CGContextDrawImage(context, CGRectMake(10, 200, 300, 450), image2.CGImage);
}

@end
