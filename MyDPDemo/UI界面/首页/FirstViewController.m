//
//  FirstViewController.m
//  MyDPDemo
//
//  Created by Zkl on 15/3/27.
//  Copyright (c) 2015年 Zkl. All rights reserved.
//

#import "FirstViewController.h"
#import "Button.h"
#import "Method.h"
#import "QiangGouCell.h"
#import "QiangGouModel.h"
#import "TuiJianCell.h"
#import "TuiJianModel.h"
#import "JieShaoCell.h"
#import "JieShaoModel.h"


@interface FirstViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIScrollView *topScrollView;//上部滚动视图

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSMutableArray *likeDatas;//存放"猜你喜欢"数据


@end

@implementation FirstViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"首页";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor clearColor];
    
//    设置tableView
    [self createTableView];
    

    
//#pragma mark -- 绑定cellxib
//    UINib *qianggouNib = [UINib nibWithNibName:@"GiangGouModel" bundle:nil];
//    
//    [_tableView registerNib:qianggouNib forCellReuseIdentifier:@"qianggou"];
//    
//    UINib *tuijianNib = [UINib nibWithNibName:@"TuiJianModel" bundle:nil];
//    
//    [_tableView registerNib:tuijianNib forCellReuseIdentifier:@"tuijian"];
//    
//    UINib *jieshaoNib = [UINib nibWithNibName:@"JieShaoModel" bundle:nil];
//    
//    [_tableView registerNib:jieshaoNib forCellReuseIdentifier:@"jieshao"];
    
}

#pragma mark -- 设置tableView
- (void)createTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    _tableView.backgroundColor = [UIColor lightGrayColor];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

#pragma mark -- UITableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3 + _likeDatas.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 220;
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
 
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)];
//    view.backgroundColor = [UIColor grayColor];
    
    _tableView.tableHeaderView = view;
    
    [self createTopScrollView];
    
    [view addSubview:_topScrollView];
    [view addSubview:_pageControl];
    
    return view;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    
#pragma mark -- 大牌抢购
    //第一个cell
    if(indexPath.row == 0) {
        QiangGouCell *cell1 = [QiangGouCell cellWithTableView:tableView];
        cell = cell1;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 20)];
        
        view.backgroundColor = [UIColor lightGrayColor];
        
        [cell.contentView addSubview:view];
        
    } else if (indexPath.row == 1){
    
        TuiJianCell *cell2 = [TuiJianCell cellWithTableView:tableView];
        cell2.backgroundColor = [UIColor lightGrayColor];
        cell = cell2;
    
    } else {
        JieShaoCell *cell3 = [JieShaoCell cellWithTableView:tableView];
        
        cell =cell3;
        
    }
    
      return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return 80;
    } else if(indexPath.row == 1) {
        return 160;
    } else {
        return 100;
    }
    
}

#pragma mark -- 设置上部按钮的滚动视图
- (void)createTopScrollView {
    
    _topScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 180)];
    
    _topScrollView.backgroundColor = [UIColor whiteColor];
    _topScrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, 1);
    //设置翻页模式
    _topScrollView.pagingEnabled = YES;
    //隐藏横向滚动条
    _topScrollView.showsHorizontalScrollIndicator = NO;//默认为 YES 不隐藏
    //给滚动控件设置代理
    _topScrollView.delegate = self;
    
    
    //翻页指示控件
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_topScrollView.frame), self.view.frame.size.width, 20)];
    //设置页数
    _pageControl.numberOfPages = 3;
    //普通状态时的颜色
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    //选中状态时的颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    _pageControl.backgroundColor = [UIColor whiteColor];
    
    //向滚动视图添加按钮
    [self putButtonsToTopScrollView];
    
}


#pragma mark -- UIScrollView的代理方法

//引入滚动视图的代理方法，实现翻页时小圆点同时移动，显示当前页数
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGPoint point = scrollView.contentOffset;
    
    //判断当前页数
    NSInteger num = point.x / self.view.frame.size.width;
    
//    if (num == -1) {
//        point.x = 2;
////        _pageControl.currentPage = 0;
//    } else if(num == 2+1) {
//        point.x = 0;
//    } else {
//        point.x = 1;
////        _pageControl.currentPage = 1;
//    }
    
    _pageControl.currentPage = num;
    
//    _topScrollView.contentOffset = CGPointMake(point.x*self.view.frame.size.width, 0);
}

//向上面的滚动视图添加按钮
- (void)putButtonsToTopScrollView {
    CGFloat width = self.view.frame.size.width;
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, _topScrollView.frame.size.height)];
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(v1.frame), 0, width, _topScrollView.frame.size.height)];
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(v2.frame), 0, width, _topScrollView.frame.size.height)];

    NSArray *array = @[v1, v2, v3];
    
    
    
    //应用名称
    NSArray *titles1 = @[@"美食", @"小吃快餐", @"休闲娱乐", @"全部分类", @"团购", @"订酒店", @"订外卖", @"看电影"];
    //按钮背景图片
    NSArray *images1 = @[@"food_u@3x", @"snack_u@3x", @"relax@3x", @"relax@3x", @"groupon_u@3x", @"bar_o@3x", @"takeaway_u@3x", @"film_u@3x"];
    
    NSArray *titles2 = @[@"丽人", @"亲子", @"结婚", @"家装", @"订座", @"找优惠", @"有料", @"看演出"];
    //按钮背景图片
    NSArray *images2 = @[@"beauty@3x", @"baby@3x", @"marry@3x", @"jiazhuang@3x", @"beauty@3x", @"baby@3x", @"marry@3x", @"jiazhuang@3x"];
    
    NSArray *titles3 = @[@"足疗按摩", @"周边游", @"KTV", @"购物商场", @"会员卡", @"拍婚照", @"爱车"];
    //按钮背景图片
    NSArray *images3 = @[@"footer@3x", @"footer@3x", @"ktv_u@3x", @"shoppingmall@3x", @"shoppingmall@3x", @"marry_u@3x", @"marry_u@3x"];
    
    CGFloat w = 50;
    CGFloat h = 50;
    
    CGFloat gap = 20;
    
    for (int j = 0; j < 3; j++) {
        
        [_topScrollView addSubview:array[j]];

        
        for (int i = 0; i < titles1.count; i++) {
            CGFloat row = i / 4;//行
            CGFloat column = i % 4;//列
            
            //应用图标按钮
            Button *button1 = [Button buttonWithFrame:CGRectMake(gap+(gap+w)*column, row*(h+gap*2), w, h) type:UIButtonTypeCustom title:nil backgroundImage:images1[i] image:nil andBlock:^(Button *button) {
                
                NSLog(@"上部的滚动视图:第一页");
                
            }];
            
            [array[0] addSubview:button1];
            
             UILabel *name1 = [UILabel labelWithFrame:CGRectMake(gap+(gap+w)*column, row*(h+gap*2)+gap*2, w, 40) title:titles1[i] textFont:12 textColor:[UIColor blackColor]];
            name1.textAlignment = NSTextAlignmentCenter;
            
            [array[0] addSubview:name1];
        }
        for (int i = 0; i < titles2.count; i++) {
            CGFloat row = i / 4;//行
            CGFloat column = i % 4;//列
            
            Button *button2 = [Button buttonWithFrame:CGRectMake(gap+(gap+w)*column, row*(h+gap*2), w, h) type:UIButtonTypeCustom title:nil backgroundImage:images2[i] image:nil andBlock:^(Button *button) {
                
                NSLog(@"上部的滚动视图:第二页");
                
            }];
            
            [array[1] addSubview:button2];
            
            //应用下面的名称
            UILabel *name2 = [UILabel labelWithFrame:CGRectMake(gap+(gap+w)*column, row*(h+gap*2)+gap*2, w, 40) title:titles2[i] textFont:12 textColor:[UIColor blackColor]];
            name2.textAlignment = NSTextAlignmentCenter;

            [array[1] addSubview:name2];
            
        }
        for (int i = 0; i < titles3.count; i++) {
            CGFloat row = i / 4;//行
            CGFloat column = i % 4;//列
            
            Button *button3 = [Button buttonWithFrame:CGRectMake(gap+(gap+w)*column, row*(h+gap*2), w, h) type:UIButtonTypeCustom title:nil backgroundImage:images3[i] image:nil andBlock:^(Button *button) {
                
                NSLog(@"上部的滚动视图:第三页");
                
            }];
            
            [array[2] addSubview:button3];

            UILabel *name3 = [UILabel labelWithFrame:CGRectMake(gap+(gap+w)*column, row*(h+gap*2)+gap*2, w, 40) title:titles3[i] textFont:12 textColor:[UIColor blackColor]];
            name3.textAlignment = NSTextAlignmentCenter;

            [array[2] addSubview:name3];

        }
    }
    
    

    
}



- (void)dealloc {
    
    [_tableView release];
    [_topScrollView release];
    
    [super dealloc];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
