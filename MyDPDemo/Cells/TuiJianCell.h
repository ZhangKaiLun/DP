//
//  TuiJianCell.h
//  MyDPDemo
//
//  Created by Zkl on 15/3/29.
//  Copyright (c) 2015年 Zkl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuiJianCell : UITableViewCell

#pragma mark -- 第一个
@property (retain, nonatomic) IBOutlet UILabel *firstTitle;
@property (retain, nonatomic) IBOutlet UILabel *firstDescribe;
@property (retain, nonatomic) IBOutlet UIImageView *firstImageView;
#pragma mark -- 第二个
@property (retain, nonatomic) IBOutlet UILabel *secondTitle;
@property (retain, nonatomic) IBOutlet UILabel *secondDescribe;
@property (retain, nonatomic) IBOutlet UIImageView *secontImageView;
#pragma mark -- 第三个
@property (retain, nonatomic) IBOutlet UILabel *thirdTitle;
@property (retain, nonatomic) IBOutlet UILabel *thirdDescribe;
@property (retain, nonatomic) IBOutlet UIImageView *thirdImageView;
#pragma mark -- 第四个
@property (retain, nonatomic) IBOutlet UILabel *forthTitle;
@property (retain, nonatomic) IBOutlet UILabel *forthDescribe;
@property (retain, nonatomic) IBOutlet UIImageView *forthImageView;



+ (TuiJianCell *)cellWithTableView:(UITableView *)tableView;


@end
