//
//  ThirdView.m
//  图形绘制
//
//  Created by qsyMac on 16/3/10.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "ThirdView.h"

@implementation ThirdView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
        [self drawEllipse:context];//绘制椭圆方法4
        [self drawArc:context];//绘制弧度方法4
        [self drawCurve:context];//绘制贝塞尔曲线4
}

#pragma mark 绘制椭圆
- (void)drawEllipse:(CGContextRef)context {
    CGRect rect = CGRectMake(50, 50, 220, 220);
    CGContextAddEllipseInRect(context, rect);
    
    [[UIColor purpleColor]set];
    
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark 绘制弧度
- (void)drawArc:(CGContextRef)context {
    CGContextAddArc(context, 260, 550, 100.0, 0, M_PI_2, 1);
    
    [[UIColor yellowColor]set];
    
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark 绘制贝塞尔曲线
-(void)drawCurve:(CGContextRef)context{
    
    //绘制曲线
    CGContextMoveToPoint(context, 20, 100);//移动到起始位置
    /*绘制二次贝塞尔曲线
     c:图形上下文
     cpx:控制点x坐标
     cpy:控制点y坐标
     x:结束点x坐标
     y:结束点y坐标
     */
    CGContextAddQuadCurveToPoint(context, 160, 0, 300, 100);
    
    CGContextMoveToPoint(context, 20, 500);
    /*绘制三次贝塞尔曲线
     c:图形上下文
     cp1x:第一个控制点x坐标
     cp1y:第一个控制点y坐标
     cp2x:第二个控制点x坐标
     cp2y:第二个控制点y坐标
     x:结束点x坐标
     y:结束点y坐标
     */
    CGContextAddCurveToPoint(context, 80, 300, 240, 500, 300, 300);
    
    //设置图形上下文属性
    [[UIColor yellowColor]setFill];
    [[UIColor redColor]setStroke];
    
    
    //绘制路径
    CGContextDrawPath(context, kCGPathFillStroke);
    
}

@end
