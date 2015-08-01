//
//  Itemstore.m
//  order
//
//  Created by 王王 on 15/7/26.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "Itemstore.h"


@interface Itemstore()

@property (nonatomic) NSMutableArray *privateAllItems;
@property (nonatomic,assign) int fileindex;
@end


@implementation Itemstore


+(instancetype)shareduserstore
{
    static dispatch_once_t once_t;
    static Itemstore* itemStoreSingleton;
    
    dispatch_once(&once_t,^{
        itemStoreSingleton=[[self alloc]initPrivate];
    });
    
    return  itemStoreSingleton;
}

- (instancetype)initPrivate
{
    self=[super init];
    if(self)
    {
        self.privateAllItems=[[NSMutableArray alloc]init];
        self.fileindex=1;
        [self loadItemsFromFile:self.fileindex];
        self.fileindex++;
    }
    return  self;
}


-(NSArray*)allItems
{
    return  [self.privateAllItems copy];
}


-(void)loadMoreItems
{
    if(self.fileindex==6)
    {
        return;
    }
    
    [self loadItemsFromFile:self.fileindex];
    
    self.fileindex++;

}

-(void)loadItemsFromFile:(int)fileindex
{
    NSString *filename=[NSString stringWithFormat:@"%d",fileindex];
    
    NSData *data=[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:filename ofType:@"json"]];
    
    NSMutableDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSArray *newitems=[dic objectForKey:@"items"];
    NSIndexSet *indexes=[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, [newitems count])];
    [self.privateAllItems insertObjects:newitems atIndexes:indexes];
}

@end
