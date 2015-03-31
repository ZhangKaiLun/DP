//
//  QiangGouCell.h
//  MyDPDemo
//
//  Created by Zkl on 15/3/29.
//  Copyright (c) 2015年 Zkl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QiangGouModel.h"

@interface QiangGouCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UIImageView *leftImage;
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;
@property (retain, nonatomic) IBOutlet UILabel *describeLabel;
@property (retain, nonatomic) IBOutlet UILabel *priceLabel;
@property (retain, nonatomic) IBOutlet UIImageView *topImageView;
@property (retain, nonatomic) IBOutlet UIImageView *rightImageView;

+ (QiangGouCell *)cellWithTableView:(UITableView *)tableView;

@end
