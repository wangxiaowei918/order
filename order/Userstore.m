//
//  User.m
//  order
//
//  Created by 王王 on 15/7/25.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "Userstore.h"

@interface Userstore ()

@property (nonatomic) NSMutableArray *privateAllUsers;

@end

@implementation Userstore

+(instancetype)shareduserstore
{
    static dispatch_once_t once_t;
    static Userstore* userStoreSingleton;
    
    dispatch_once(&once_t,^{
        userStoreSingleton=[[self alloc]initPrivate];
                            });
    
    return  userStoreSingleton;
}

- (instancetype)initPrivate
{
    self=[super init];
    if(self)
    {
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        [defaults synchronize];
        
        NSData* data  = [defaults objectForKey:@"reguser"];
        NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        if(oldSavedArray)
        {
            self.privateAllUsers=[[NSMutableArray alloc]initWithArray:oldSavedArray];
        }
        else
        {
            self.privateAllUsers=[[NSMutableArray alloc]init];
        }
        
        NSData *currentUserData=[defaults objectForKey:@"currentuser"];
        self.currentUser=(User*)[NSKeyedUnarchiver unarchiveObjectWithData:currentUserData];
    }
    return  self;
}


-(NSArray*)allUsers
{
    return  [self.privateAllUsers  copy];
}


-(User*)createRegisteredUser
{
    User* user=[[User alloc]init];
    [self.privateAllUsers addObject:user];
    self.currentUser=user;
    return  user;
}


-(void)saveUser
{
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    for(User* obj in _privateAllUsers)
    {
        NSLog(@"%@, %@ %d,%@", obj.username, obj.password,obj.isLogged,obj.address);
    }
    
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:self.privateAllUsers] forKey:@"reguser"];
    
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:self.currentUser] forKey:@"currentuser"];
    
    [defaults synchronize];
    
}


#if 0
-(void)readUser
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    
    NSData* data  = [defaults objectForKey:@"currentuser"];

    NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    for(User* obj in oldSavedArray)
    {
        NSLog(@"%@, %@  %d", obj.username, obj.password,obj.isLogged);
    }
}
#endif

@end
