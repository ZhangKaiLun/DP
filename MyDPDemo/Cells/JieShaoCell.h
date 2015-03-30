//
//  JieShaoCell.h
//  MyDPDemo
//
//  Created by Zkl on 15/3/29.
//  Copyright (c) 2015年 Zkl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JieShaoCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UIImageView *leftImageView;

@property (retain, nonatomic) IBOutlet UILabel *titleLabel;

@property (retain, nonatomic) IBOutlet UILabel *describeLabel;

+ (JieShaoCell *)cellWithTableView:(UITableView *)tableView;

@end
