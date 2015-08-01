//
//  MyOrderItemStore.h
//  order
//
//  Created by 王王 on 15/7/30.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
@interface MyOrderItemStore : NSObject

@property (nonatomic,readonly) NSArray *MyOrders;
+(instancetype)sharedMyOrderStore;
-(Item*)createItem;
-(void)saveOrders;
-(instancetype)initPirvate;
-(void)removeItem:(int)index;
@end
