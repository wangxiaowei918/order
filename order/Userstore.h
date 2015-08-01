//
//  User.h
//  order
//
//  Created by 王王 on 15/7/25.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Userstore: NSObject

@property (nonatomic, readonly) NSArray *allUsers;
@property (nonatomic, strong) User* currentUser;

+(instancetype)shareduserstore;

-(User*)createRegisteredUser;
-(void)saveUser;
//-(void)readUser;
@end
