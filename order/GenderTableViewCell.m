//
//  GenderTableViewCell.m
//  order
//
//  Created by 王王 on 15/7/30.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "GenderTableViewCell.h"

@implementation GenderTableViewCell

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
            
        }
        
    }
    return self;
}

@end
