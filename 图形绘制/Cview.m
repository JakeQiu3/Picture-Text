//
//  Cview.m
//  图形绘制
//
//  Created by qsyMac on 16/3/10.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "CView.h"
@interface CView ()

@end
@implementation CView

- (void)drawRect:(CGRect)rect {
    [self drawText];
}
//  ==========参数就是属性================
#warning 少 ：任何参数都可以设置为属性（变量），然后就可以实现随意改变。 可以说-> 参数就是属性。
//下面的参数：字符串，cgrect或cgpoint，color，fontName或Size 这些都可以用作设置为属性。
- (void)drawText {
    NSString *str = _title;
    [str drawInRect:CGRectMake(20, 120, 300, 200) withAttributes:@{NSForegroundColorAttributeName : [UIColor redColor],NSFontAttributeName : [UIFont fontWithName:@"Marker Felt" size:_fontSize]}];
}
@end
