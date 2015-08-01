//
//  MyInfoListTableViewCell.m
//  order
//
//  Created by 王王 on 15/7/29.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "MyInfoListTableViewCell.h"
#import "Userstore.h"


@interface MyInfoListTableViewCell()



@end
@implementation MyInfoListTableViewCell

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
        
        self.head =[[UILabel alloc]initWithFrame:CGRectMake(10, 15, 100, 50)];
        self.head.text=@"头像";
        [self.contentView addSubview:self.head];
        
        self.headimageview=[[UIImageView alloc]initWithFrame:CGRectMake(200,0,80,80)];
        self.headimageview.image=[[Userstore shareduserstore] currentUser].head;
        [self.contentView addSubview:self.headimageview];
    }
    return self;
}


@end
