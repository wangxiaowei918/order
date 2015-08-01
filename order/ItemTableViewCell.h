//
//  ItemTableViewCell.h
//  order
//
//  Created by 王王 on 15/7/26.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *thumbNail;
@property (nonatomic,strong) UILabel * itemName;
@property (nonatomic,strong) UILabel * itemPrice;

@end
