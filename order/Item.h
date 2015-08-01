//
//  Item.h
//  order
//
//  Created by 王王 on 15/7/26.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Item : NSObject<NSCoding>

@property(nonatomic,strong) NSString * descrip;
@property(nonatomic,strong) NSString * pricestring;
@property(nonatomic,strong) UIImage *itemImage;
@property(nonatomic,assign) NSUInteger number;//购买某件商品的件数

@end
