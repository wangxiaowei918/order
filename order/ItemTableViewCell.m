//
//  ItemTableViewCell.m
//  order
//
//  Created by 王王 on 15/7/26.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "ItemTableViewCell.h"

@interface ItemTableViewCell()

@end

@implementation ItemTableViewCell

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
        
        UIImageView *thumbNail =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        [self.contentView addSubview:thumbNail];
        _thumbNail=thumbNail;
        
        UILabel *itemName =[[UILabel alloc]initWithFrame:CGRectMake(80, 0, 200, 50)];
        [self.contentView addSubview:itemName];
        _itemName=itemName;
        
        UILabel *itemPrice =[[UILabel alloc]initWithFrame:CGRectMake(80, 50, 100, 30)];
        [self.contentView addSubview:itemPrice];
        _itemPrice =itemPrice;
    }
    return self;
}

@end
