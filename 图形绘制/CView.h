//
//  Cview.h
//  图形绘制
//
//  Created by qsyMac on 16/3/10.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CView : UIView

#warning 少 ：任何参数都可以设置为属性（变量），然后就可以实现随意改变。
//手动绘制的文字。
@property (nonatomic, copy) NSString *title;
//手动绘制的字体大小
@property (nonatomic, assign) CGFloat fontSize;

@end
