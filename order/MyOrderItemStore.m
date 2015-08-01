//
//  MyOrderItemStore.m
//  order
//
//  Created by 王王 on 15/7/30.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "MyOrderItemStore.h"
#import "Userstore.h"


@interface MyOrderItemStore()

@property (nonatomic) NSMutableArray *privateMyOrders;
@end


@implementation MyOrderItemStore

+(instancetype)sharedMyOrderStore
{
    
    if(![[Userstore shareduserstore]currentUser].MyOrderItemStore)
    {
        [[Userstore shareduserstore]currentUser].MyOrderItemStore = [[self alloc] initPirvate];
    }
    
    return [[Userstore shareduserstore]currentUser].MyOrderItemStore;
}


-(instancetype)initPirvate
{
    self=[super init];
    if(self)
    {
        self.privateMyOrders=[[NSMutableArray alloc]init];
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        [defaults synchronize];
        
        NSString *currentUserName=[[Userstore shareduserstore]currentUser].username;
        
        
        NSData* data  = [defaults objectForKey:currentUserName];
        NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        NSLog(@"%@ %@ ",currentUserName,oldSavedArray);
        
        if(oldSavedArray)
        {
            self.privateMyOrders=[[NSMutableArray alloc]initWithArray:oldSavedArray];
        }
        else
        {
            self.privateMyOrders=[[NSMutableArray alloc]init];
        }

    }
    return self;
    
}



-(NSArray*)MyOrders
{
    return [self.privateMyOrders copy];
}

-(Item*)createItem
{
    Item* item=[[Item alloc]init];
    [self.privateMyOrders addObject:item];
    
    return item;
}

-(void)removeItem:(int)index
{
    [self.privateMyOrders removeObjectAtIndex:index];
}

-(void)saveOrders
{

    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults synchronize];

    NSString *currentUserName=[[Userstore shareduserstore]currentUser].username;
    
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:self.privateMyOrders] forKey:currentUserName];
    
    [defaults synchronize];
    
}



@end
