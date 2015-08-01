//
//  Item.m
//  order
//
//  Created by 王王 on 15/7/26.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "Item.h"

@implementation Item


-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.descrip forKey:@"descrip"];
    [aCoder encodeObject:self.pricestring forKey:@"pricestring"];
    [aCoder encodeInteger:self.number forKey:@"number"];
    
    NSData * data = UIImageJPEGRepresentation(self.itemImage,1.0);
    [aCoder encodeObject:data forKey:@"itemImage"];
    
    
    
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.descrip = [aDecoder decodeObjectForKey:@"descrip"];
        self.pricestring = [aDecoder decodeObjectForKey:@"pricestring"];
        self.number = [aDecoder decodeIntegerForKey:@"number"];
        
        NSData *data=[aDecoder decodeObjectForKey:@"itemImage"];
        self.itemImage=[UIImage imageWithData:data];
    }
    return self;
    
}


@end
