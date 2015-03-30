//
//  QiangGouCell.m
//  MyDPDemo
//
//  Created by Zkl on 15/3/29.
//  Copyright (c) 2015年 Zkl. All rights reserved.
//

#import "QiangGouCell.h"

@implementation QiangGouCell

- (void)awakeFromNib {
    // Initialization code
}

+ (QiangGouCell *)cellWithTableView:(UITableView *)tableView {
    NSString *ident = @"qianggou";
    
    QiangGouCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"QiangGouXib" owner:self options:nil] firstObject];
        
    }
    
    return cell;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_leftImage release];
    [_titleLabel release];
    [_describeLabel release];
    [_priceLabel release];
    [_topImageView release];
    [_rightImageView release];
    [super dealloc];
}
@end
