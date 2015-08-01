//
//  User.h
//  order
//
//  Created by 王王 on 15/7/25.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  <UIKit/UIImage.h>
#import "MyOrderItemStore.h"

@interface User : NSObject<NSCoding>

@property(nonatomic,copy) NSString* username;
@property(nonatomic,copy) NSString* password;
@property(nonatomic,assign) BOOL isLogged;
@property(nonatomic,strong)UIImage * head;
@property(nonatomic,copy) NSString *gender;
@property(nonatomic,copy) NSString *address;
@property(nonatomic,strong) MyOrderItemStore *MyOrderItemStore;

@end
