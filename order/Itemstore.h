//
//  Itemstore.h
//  order
//
//  Created by 王王 on 15/7/26.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Itemstore : NSObject

@property (nonatomic, readonly) NSArray *allItems;


+(instancetype)shareduserstore;
-(void)loadMoreItems;
@end
