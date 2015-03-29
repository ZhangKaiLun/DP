//
//  Button.h
//  block基础知识
//
//  Created by qianfeng on 15/3/6.
//  Copyright (c) 2015年 张凯伦. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Button;
typedef void (^block)(Button *button);

@interface Button : UIButton

+ (Button *)buttonWithFrame:(CGRect)frame type:(UIButtonType)type title:(NSString *)title target:(id)target action:(SEL)sel;

//利用Block封装的button
+ (Button *)buttonWithFrame:(CGRect)frame type:(UIButtonType)type title:(NSString *)title andBlock:(block)tempBlock;

+ (Button *)buttonWithFrame:(CGRect)frame type:(UIButtonType)type title:(NSString *)title backgroundImage:(NSString *)background image:(NSString *)image andBlock:(block)tempBlock;

@end
