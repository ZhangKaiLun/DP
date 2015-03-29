//
//  KLTabBarViewController.m
//  爱限免-框架
//
//  Created by qianfeng on 15/3/10.
//  Copyright (c) 2015年 张凯伦. All rights reserved.
//

#import "KLTabBarViewController.h"

@interface KLTabBarViewController ()

@end

@implementation KLTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    //隐藏系统的tabBar
//    self.tabBar.hidden = YES;

    
}

//使用系统的tabBar，系统的最多可以显示5个选项
- (UIViewController *)controllerWithString:(NSString *)controller title:(NSString *)title andImage:(NSString *)imageName {
    
    //1.得到这个对象的类
    //把一个字符串转化为一个类
    Class viewController = NSClassFromString(controller);
    
    //2.得到对象
    //父类的指针指向子类的对象，多态的体现
    UIViewController *con = [[viewController alloc] init];
    //直接给视图控制器设置标题即可，这样它对应的导航也是同样的标题
//    con.title = title;
    con.tabBarItem.title = title;
    //3.放到导航控制器上
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:con];
    
    nav.tabBarItem.image = [UIImage imageNamed:imageName];
//    nav.title = @"";
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar"] forBarMetrics:UIBarMetricsDefault];
//    nav.title = title;
    
    //4.把导航控制器放入标签栏控制器(要用到成员变量self.viewControllers，所以只能使用对象方法，优先考虑类方法)
    
    //说明：标签栏中放置导航控制器的数组self.viewControllers是不可变数组，而我们需要创建5个导航控制器，一个一个的添加上去，所以需要可变数组。因此，先创建一个可变数组，将self.viewControllers赋给它，然后把创建好的导航控制器放置到临时数组中，再把临时数组赋给self.viewControllers
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:self.viewControllers];
    
    [tempArr addObject:nav];
    
    self.viewControllers = tempArr;
    
    //5.将当前的视图控制器返回
    return con;//返回对象的目的是要传网址进来
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
