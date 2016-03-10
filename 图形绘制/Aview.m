//
//  Aview.m
//  图形绘制
//
//  Created by qsyMac on 16/3/10.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "Aview.h"

@implementation Aview

- (void)drawRect:(CGRect)rect {//viewDidLoad方法后执行，显示控件时调用
        [self drawLine1];//绘制3角形方法1
        [self drawLine2];//绘制3角形方法2
    //  取得图形上下文对象
    CGContextRef context = UIGraphicsGetCurrentContext();
        [self drawRectWithContext:context];//绘制矩形方法1
    [self drawRectByUIKitWithContext:context];//绘制矩形方法2
    [self drawRectWithLinearGradientFill:context];//矩形内渐变填充
}

- (void)drawLine1 {
    //  取得图形上下文对象
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.创建路径对象
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 20, 50);//移动到指定位置（设置路径起点
    CGPathAddLineToPoint(path, nil, 20, 100);//绘制直线（从起始位置开始）
    CGPathAddLineToPoint(path, nil, 300, 100);//绘制另外一条直线（从上一直线终点开始绘制）
    //3.将路径添加到上下文
    CGContextAddPath(context, path);
    //4.设置图形上下文状态属性
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);//设置笔触颜色
    CGContextSetRGBFillColor(context, 0, 1.0, 0, 1);//设置填充色:绿色
    CGContextSetLineWidth(context, 2.0f);//设置线条宽度
    CGContextSetLineCap(context, kCGLineCapRound);//设置顶点样式,（20,50）和（300,100）是顶点
    CGContextSetLineJoin(context, kCGLineJoinRound);//设置连接点样式，(20,100)是连接点
    /*设置线段样式
     phase:虚线开始的位置
     lengths:虚线长度间隔（例如下面的定义说明第一条线段长度8，然后间隔3重新绘制8点的长度线段，当然这个数组可以定义更多元素）
     count:虚线数组元素个数
     */
    CGFloat lengths[2] = {18,9};
    CGContextSetLineDash(context, 0, lengths, 2);
    
    /*设置阴影
     context:图形上下文
     offset:偏移量
     blur:模糊度
     color:阴影颜色
     */
    CGColorRef color = [UIColor grayColor].CGColor;//颜色转化，由于Quartz 2D跨平台，所以其中不能使用UIKit中的对象，但是UIkit提供了转化方法
    CGContextSetShadowWithColor(context,  CGSizeMake(2, 2), 0.8, color);
    
    //     5.绘制路径到上下文
    CGContextDrawPath(context, kCGPathFillStroke);
    //    6.释放对象
    CGPathRelease(path);
}

- (void)drawLine2 {
    
    CGContextRef context = UIGraphicsGetCurrentContext()
    ;
//    设置3个点的坐标：绝对位置
    CGContextMoveToPoint(context, 20, 150);
    CGContextAddLineToPoint(context, 20, 250);
    CGContextAddLineToPoint(context, 300, 100);
    CGContextClosePath(context);
    
    [[UIColor redColor]setStroke];//设置红色边框
    [[UIColor purpleColor]setFill];//设置绿色填充
    
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark 绘制矩形
-(void)drawRectWithContext:(CGContextRef)context{
    //添加矩形对象
    CGRect rect=CGRectMake(20, 260, 280.0, 50.0);
    CGContextAddRect(context,rect);
    //设置属性
    [[UIColor blueColor]set];
    //绘制
    CGContextDrawPath(context, kCGPathFillStroke);
}

//边框和绘制内容分离的矩形
-(void)drawRectByUIKitWithContext:(CGContextRef)context{
    CGRect rect= CGRectMake(20, 350, 280.0, 50.0);
    CGRect rect2=CGRectMake(20, 380, 280.0, 50.0);
    //设置属性
    [[UIColor yellowColor]set];
    //绘制矩形,相当于创建对象、添加对象到上下文、绘制三个步骤
    UIRectFill(rect);//绘制矩形（只有填充）
    
    [[UIColor redColor]setStroke];
    UIRectFrame(rect2);//绘制矩形(只有边框)
}

//矩形内渐变填充
-(void)drawRectWithLinearGradientFill:(CGContextRef)context{
    CGColorSpaceRef colorSpace=CGColorSpaceCreateDeviceRGB();
    
    //裁切处一块矩形用于显示，注意必须先裁切再调用渐变
    //CGContextClipToRect(context, CGRectMake(20, 50, 280, 300));
    //裁切还可以使用UIKit中对应的方法
    UIRectClip(CGRectMake(120, 450, 150, 200));
    
    CGFloat compoents[12]={
        248.0/255.0,86.0/255.0,86.0/255.0,1,
        249.0/255.0,127.0/255.0,127.0/255.0,1,
        1.0,1.0,1.0,1.0
    };
    CGFloat locations[3]={0,0.3,1.0};
    CGGradientRef gradient= CGGradientCreateWithColorComponents(colorSpace, compoents, locations, 3);
    
    CGContextDrawLinearGradient(context, gradient, CGPointMake(120, 400), CGPointMake(270, 600), kCGGradientDrawsAfterEndLocation);
    //释放颜色空间
    CGColorSpaceRelease(colorSpace);
}

@end
