//
//  MyInfoTableViewCell.m
//  order
//
//  Created by 王王 on 15/7/28.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "MyInfoTableViewCell.h"
#import "Userstore.h"

@interface MyInfoTableViewCell ()


@end

@implementation MyInfoTableViewCell

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
        
        self.sampleInfo =[[UILabel alloc]initWithFrame:CGRectMake(90, 0, 100, 50)];
        self.sampleInfo.text=[[Userstore shareduserstore]currentUser].username;
        [self.contentView addSubview:self.sampleInfo];
        
        self.headView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,80,80)];
        self.headView.image=[[Userstore shareduserstore] currentUser].head;
        [self.contentView addSubview:self.headView];
    }
    return self;
}

@end
