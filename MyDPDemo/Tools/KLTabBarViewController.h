//
//  KLTabBarViewController.h
//  爱限免-框架
//
//  Created by qianfeng on 15/3/10.
//  Copyright (c) 2015年 张凯伦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLTabBarViewController : UITabBarController

//多态的应用
- (UIViewController *)controllerWithString:(NSString *)controller title:(NSString *)title andImage:(NSString *)imageName;

@end
