//
//  MyOrderTableViewCell.m
//  order
//
//  Created by 王王 on 15/7/28.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "MyOrderTableViewCell.h"

@implementation MyOrderTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UILabel *itemName =[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 150, 50)];
        itemName.text=@"查看我的订单";
        [self.contentView addSubview:itemName];
    }
    return self;
}

@end
