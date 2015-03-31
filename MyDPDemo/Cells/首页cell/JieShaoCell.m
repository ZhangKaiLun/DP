//
//  JieShaoCell.m
//  MyDPDemo
//
//  Created by Zkl on 15/3/29.
//  Copyright (c) 2015年 Zkl. All rights reserved.
//

#import "JieShaoCell.h"

@implementation JieShaoCell

- (void)awakeFromNib {
    // Initialization code
}


+ (JieShaoCell *)cellWithTableView:(UITableView *)tableView {
    NSString *ident = @"qianggou";
    
    JieShaoCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JieShaoCell" owner:self options:nil] firstObject];
        
    }
    
    return cell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_leftImageView release];
    [_titleLabel release];
    [_describeLabel release];
    [super dealloc];
}
@end
