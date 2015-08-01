//
//  MyOrderListTableViewCell.m
//  order
//
//  Created by 王王 on 15/7/29.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "MyOrderListTableViewCell.h"
#import "MyOrderItemStore.h"

@implementation MyOrderListTableViewCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        UIButton *minusBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [minusBtn.layer setMasksToBounds:YES];
        [minusBtn.layer setBorderWidth:1.0];
        
        [minusBtn setTitle:@"-" forState:UIControlStateNormal];
        [minusBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        minusBtn.frame=CGRectMake(200, 50, 25, 25);
        [self.contentView addSubview:minusBtn];
        
        [minusBtn addTarget:self action:@selector(minus) forControlEvents:UIControlEventTouchUpInside];
        
        self.numberLabel=[[UILabel alloc]initWithFrame:CGRectMake(225, 50, 50, 25)];
        self.numberLabel.layer.borderColor=[UIColor blackColor].CGColor;
        self.numberLabel.layer.borderWidth=1.0;
        [self.contentView addSubview:self.numberLabel];
        self.numberLabel.text=@"1";
        self.numberLabel.textColor=[UIColor redColor];
        self.numberLabel.textAlignment=NSTextAlignmentCenter;
        
        
        
        UIButton *addBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [addBtn.layer setMasksToBounds:YES];
        [addBtn.layer setBorderWidth:1.0];
        
        [addBtn setTitle:@"+" forState:UIControlStateNormal];
        [addBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        addBtn.frame=CGRectMake(275, 50, 20, 25);
        [addBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.contentView addSubview:addBtn];
    }
    return  self;
}

-(void)add
{
    if(self.addAction)
    {
        self.addAction();
    }
    NSUInteger i=[self.numberLabel.text intValue];
    i++;
    self.numberLabel.text=[NSString stringWithFormat:@"%d",i];
    [[MyOrderItemStore sharedMyOrderStore]saveOrders];
}

-(void)minus
{
    if(self.minusAction)
    {
        self.minusAction();
        NSUInteger i=[self.numberLabel.text intValue];
        if(i>1)
        {
            i--;
            self.numberLabel.text=[NSString stringWithFormat:@"%d",i];
        }
    }
    [[MyOrderItemStore sharedMyOrderStore]saveOrders];
}

@end
