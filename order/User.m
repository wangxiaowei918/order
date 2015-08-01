//
//  User.m
//  order
//
//  Created by 王王 on 15/7/25.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "User.h"

@implementation User

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeBool:self.isLogged forKey:@"isLogged"];
    [aCoder encodeObject:self.gender forKey:@"gender"];
    [aCoder encodeObject:self.address forKey:@"address"];
    
    NSData * data = UIImageJPEGRepresentation(self.head,1.0);
    [aCoder encodeObject:data forKey:@"head"];
    
    
    
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.username = [aDecoder decodeObjectForKey:@"username"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.isLogged = [aDecoder decodeBoolForKey:@"isLogged"];
        self.gender =[aDecoder decodeObjectForKey:@"gender"];
        self.address =[aDecoder decodeObjectForKey:@"address"];
        NSData *data=[aDecoder decodeObjectForKey:@"head"];
        self.head=[UIImage imageWithData:data];
        }
    return self;
    
}

@end
