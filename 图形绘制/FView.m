//
//  FView.m
//  图形绘制
//
//  Created by qsyMac on 16/3/10.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "FView.h"

@implementation FView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawRectByUIKitWithContext2:context];
    
}

//叠加模式
-(void)drawRectByUIKitWithContext2:(CGContextRef)context{
    CGRect rect= CGRectMake(0, 130.0, 320.0, 50.0);
    CGRect rect1= CGRectMake(0, 390.0, 320.0, 50.0);
    CGRect rect2=CGRectMake(20, 50.0, 10.0, 250.0);
    CGRect rect3=CGRectMake(40.0, 50.0, 10.0, 250.0);
    CGRect rect4=CGRectMake(60.0, 50.0, 10.0, 250.0);
    CGRect rect5=CGRectMake(80.0, 50.0, 10.0, 250.0);
    CGRect rect6=CGRectMake(100.0, 50.0, 10.0, 250.0);
    CGRect rect7=CGRectMake(120.0, 50.0, 10.0, 250.0);
    CGRect rect8=CGRectMake(140.0, 50.0, 10.0, 250.0);
    CGRect rect9=CGRectMake(160.0, 50.0, 10.0, 250.0);
    CGRect rect10=CGRectMake(180.0, 50.0, 10.0, 250.0);
    CGRect rect11=CGRectMake(200.0, 50.0, 10.0, 250.0);
    CGRect rect12=CGRectMake(220.0, 50.0, 10.0, 250.0);
    CGRect rect13=CGRectMake(240.0, 50.0, 10.0, 250.0);
    CGRect rect14=CGRectMake(260.0, 50.0, 10.0, 250.0);
    CGRect rect15=CGRectMake(280.0, 50.0, 10.0, 250.0);
    
    CGRect rect16=CGRectMake(30.0, 310.0, 10.0, 250.0);
    CGRect rect17=CGRectMake(50.0, 310.0, 10.0, 250.0);
    CGRect rect18=CGRectMake(70.0, 310.0, 10.0, 250.0);
    CGRect rect19=CGRectMake(90.0, 310.0, 10.0, 250.0);
    CGRect rect20=CGRectMake(110.0, 310.0, 10.0, 250.0);
    CGRect rect21=CGRectMake(130.0, 310.0, 10.0, 250.0);
    CGRect rect22=CGRectMake(150.0, 310.0, 10.0, 250.0);
    CGRect rect23=CGRectMake(170.0, 310.0, 10.0, 250.0);
    CGRect rect24=CGRectMake(190.0, 310.0, 10.0, 250.0);
    CGRect rect25=CGRectMake(210.0, 310.0, 10.0, 250.0);
    CGRect rect26=CGRectMake(230.0, 310.0, 10.0, 250.0);
    CGRect rect27=CGRectMake(250.0, 310.0, 10.0, 250.0);
    CGRect rect28=CGRectMake(270.0, 310.0, 10.0, 250.0);
    CGRect rect29=CGRectMake(290.0, 310.0, 10.0, 250.0);
    
    
    [[UIColor yellowColor]set];
    
    UIRectFill(rect);
    [[UIColor greenColor]setFill];
    
    UIRectFill(rect1);
    [[UIColor redColor]setFill];
    UIRectFillUsingBlendMode(rect2, kCGBlendModeClear);
    UIRectFillUsingBlendMode(rect3, kCGBlendModeColor);
    UIRectFillUsingBlendMode(rect4, kCGBlendModeColorBurn);
    UIRectFillUsingBlendMode(rect5, kCGBlendModeColorDodge);
    UIRectFillUsingBlendMode(rect6, kCGBlendModeCopy);
    UIRectFillUsingBlendMode(rect7, kCGBlendModeDarken);
    UIRectFillUsingBlendMode(rect8, kCGBlendModeDestinationAtop);
    UIRectFillUsingBlendMode(rect9, kCGBlendModeDestinationIn);
    UIRectFillUsingBlendMode(rect10, kCGBlendModeDestinationOut);
    UIRectFillUsingBlendMode(rect11, kCGBlendModeDestinationOver);
    UIRectFillUsingBlendMode(rect12, kCGBlendModeDifference);
    UIRectFillUsingBlendMode(rect13, kCGBlendModeExclusion);
    UIRectFillUsingBlendMode(rect14, kCGBlendModeHardLight);
    UIRectFillUsingBlendMode(rect15, kCGBlendModeHue);
    UIRectFillUsingBlendMode(rect16, kCGBlendModeLighten);
    
    UIRectFillUsingBlendMode(rect17, kCGBlendModeLuminosity);
    UIRectFillUsingBlendMode(rect18, kCGBlendModeMultiply);
    UIRectFillUsingBlendMode(rect19, kCGBlendModeNormal);
    UIRectFillUsingBlendMode(rect20, kCGBlendModeOverlay);
    UIRectFillUsingBlendMode(rect21, kCGBlendModePlusDarker);
    UIRectFillUsingBlendMode(rect22, kCGBlendModePlusLighter);
    UIRectFillUsingBlendMode(rect23, kCGBlendModeSaturation);
    UIRectFillUsingBlendMode(rect24, kCGBlendModeScreen);
    UIRectFillUsingBlendMode(rect25, kCGBlendModeSoftLight);
    UIRectFillUsingBlendMode(rect26, kCGBlendModeSourceAtop);
    UIRectFillUsingBlendMode(rect27, kCGBlendModeSourceIn);
    UIRectFillUsingBlendMode(rect28, kCGBlendModeSourceOut);
    UIRectFillUsingBlendMode(rect29, kCGBlendModeXOR);
}

@end
