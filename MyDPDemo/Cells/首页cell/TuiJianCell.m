//
//  TuiJianCell.m
//  MyDPDemo
//
//  Created by Zkl on 15/3/29.
//  Copyright (c) 2015年 Zkl. All rights reserved.
//

#import "TuiJianCell.h"

@implementation TuiJianCell
- (IBAction)firstAction:(id)sender {
}
- (IBAction)secondAction:(id)sender {
}
- (IBAction)thirdAction:(id)sender {
}
- (IBAction)forthAction:(id)sender {
}

- (void)awakeFromNib {
    // Initialization code
}


+ (TuiJianCell *)cellWithTableView:(UITableView *)tableView {
    NSString *ident = @"qianggou";
    
    TuiJianCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TuiJianCell" owner:self options:nil] firstObject];
        
    }
    
    return cell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_firstTitle release];
    [_firstDescribe release];
    [_firstImageView release];
    [_secondTitle release];
    [_secondDescribe release];
    [_secontImageView release];
    [_thirdTitle release];
    [_thirdDescribe release];
    [_thirdImageView release];
    [_forthTitle release];
    [_forthDescribe release];
    [_forthImageView release];
    [super dealloc];
}
@end
