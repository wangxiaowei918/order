//
//  MyOrderListTableViewCell.h
//  order
//
//  Created by 王王 on 15/7/29.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "ItemTableViewCell.h"

@interface MyOrderListTableViewCell : ItemTableViewCell

@property(nonatomic,strong)UILabel *numberLabel;
@property (copy, nonatomic) void (^minusAction)(void);
@property (copy, nonatomic) void (^addAction)(void);


@end
