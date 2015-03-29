//
//  Button.m
//  block基础知识
//
//  Created by qianfeng on 15/3/6.
//  Copyright (c) 2015年 张凯伦. All rights reserved.
//

#import "Button.h"

@interface Button()
//注意：给block变量写合成存取，一定要使用 copy !!! 
@property (nonatomic, copy) block myBlock;

@end

@implementation Button

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
//1.
+ (Button *)buttonWithFrame:(CGRect)frame type:(UIButtonType)type title:(NSString *)title target:(id)target action:(SEL)sel {
    Button *button = [UIButton buttonWithType:type];
    
    button.frame = frame;
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    
    return button;
}

//2利用block生成button对象
+ (Button *)buttonWithFrame:(CGRect)frame type:(UIButtonType)type title:(NSString *)title andBlock:(block)tempBlock {
    
    Button *button = [Button buttonWithType:type];
    
    button.frame = frame;
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button addTarget:button action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    button.myBlock = tempBlock;
    
    return button;
    
}

- (void)buttonClicked:(Button *)button {
    NSLog(@"这里是buttonClicked方法的内部");
    
    button.tag = 10;
    //触发按钮
    button.myBlock(button);
    
}

//3.
+ (Button *)buttonWithFrame:(CGRect)frame type:(UIButtonType)type title:(NSString *)title backgroundImage:(NSString *)background image:(NSString *)image andBlock:(block)tempBlock {
    
    Button *button = [Button buttonWithType:type];
        
    button.frame = frame;
        
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [button addTarget:button action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [button setBackgroundImage:[UIImage imageNamed:background] forState:UIControlStateNormal];
    
    button.myBlock = tempBlock;
        
    return button;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
