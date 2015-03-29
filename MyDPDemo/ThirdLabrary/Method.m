//
//  Method.m
//  表格视图练习
//
//  Created by qianfeng on 15/3/3.
//  Copyright (c) 2015年 张凯伦. All rights reserved.
//

#import "Method.h"

@implementation UILabel (addMethod)

+ (UILabel *)labelWithFrame:(CGRect)frame title:(NSString *)title textFont:(int)font textColor:(UIColor *)color {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    
    label.text = title;
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = color;
    label.numberOfLines = 2;
    
    return label;
}

@end

@implementation UIButton (addMethod)

+ (UIButton *)buttonWithframe:(CGRect)frame type:(UIButtonType)type title:(NSString *)title textFont:(int)font textColor:(UIColor *)color {
    UIButton *button = [UIButton buttonWithType:type];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    button.titleLabel.textColor = [UIColor blueColor];
    
    return button;
}

@end