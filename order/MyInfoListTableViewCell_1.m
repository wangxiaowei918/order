//
//  MyInfoListTableViewCell_1.m
//  order
//
//  Created by 王王 on 15/7/29.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "MyInfoListTableViewCell_1.h"

@interface MyInfoListTableViewCell_1()


@end

@implementation MyInfoListTableViewCell_1

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
        {
            self.info =[[UILabel alloc]initWithFrame:CGRectMake(10, 8, 100, 50)];
            self.info.text=@"";
            [self.contentView addSubview:self.info];
            
            self.content =[[UILabel alloc]initWithFrame:CGRectMake(230, 8, 40, 50)];
            self.content.text=@"";
            [self.contentView addSubview:self.content];
        }
        
    }
    return self;
}


@end
