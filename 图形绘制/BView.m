//
//  BView.m
//  图形绘制
//
//  Created by qsyMac on 16/3/10.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "BView.h"

@implementation BView
- (void)drawRect:(CGRect)rect {
//    获取该视图的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawText:context];//绘制文字1
}

#pragma mark 绘制文字
-(void)drawText:(CGContextRef)context {
    NSString *str = @"Star Walk is the most beautiful stargazing app you’ve ever seen on a mobile device. It will become your go-to interactive astro guide to the night sky, following your every movement in real-time and allowing you to explore over 200, 000 celestial bodies with extensive information about stars and constellations that you find,Star Walk is the most beautiful stargazing app you’ve ever seen on a mobile device. It will become your go-to interactive astro guide to the night sky, following your every movement in real-time and allowing you to explore over 200, 000 celestial bodies with extensive information about stars and constellations that you find";
    //段落样式
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentLeft;
    [str drawInRect:CGRectMake(20, 64, 280, MAXFLOAT) withAttributes:@{NSFontAttributeName :[UIFont systemFontOfSize:18],NSForegroundColorAttributeName : [UIColor redColor],NSParagraphStyleAttributeName : style}];
}

@end
