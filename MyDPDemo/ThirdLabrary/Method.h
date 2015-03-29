//
//  Method.h
//  表格视图练习
//
//  Created by qianfeng on 15/3/3.
//  Copyright (c) 2015年 张凯伦. All rights reserved.
//

/*
 说明：
    1.该类中存放的是一些封装好的控件的方法。
    2.针对 UILabel UIButton 等有好多属性的的控件，可以通过创建分类，封装一个类方法，将控件的属性以参数的形式传入，在使用时直接调用相应控件的方法即可。
    3.但是在引入头文件时会很麻烦，用到多少分类就要引入多少头文件，所以将这些方法全部放入一个类中，即该类，在使用时直接引入这个类的头文件即可。
 
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UILabel (addMethod)
+ (UILabel *)labelWithFrame:(CGRect)frame title:(NSString *)title textFont:(int)font textColor:(UIColor *)color;

@end

@interface UIButton (addMethod)
+ (UIButton *)buttonWithFrame:(CGRect)frame type:(UIButtonType)type title:(NSString *)title textFont:(int)font textColor:(UIColor *)color;

@end