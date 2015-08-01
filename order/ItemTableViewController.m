//
//  ItemTableViewController.m
//  order
//
//  Created by 王王 on 15/7/26.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "ItemTableViewController.h"
#import "ItemTableViewCell.h"
#import "Itemstore.h"
//#import "Item.h"
#import "ItemDetailViewController.h"

@interface ItemTableViewController ()

@property(nonatomic,strong) UILabel *refreshLabel;

@end

@implementation ItemTableViewController


-(instancetype)init
{
    self=[super initWithStyle:UITableViewStylePlain];
    if(self)
    {
        self.navigationItem.title=@"主页";
        self.refreshLabel=[[UILabel alloc]initWithFrame:CGRectMake(110, -60, 320, 50)];
        [self.tableView addSubview:self.refreshLabel];
    }
    
    return  self;
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

        return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[Itemstore shareduserstore]allItems]count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellname = @"ItemTableViewCell";
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellname];
    if (cell == nil) {
        cell = [[ItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
    }
    
    
    NSDictionary *item=[[[Itemstore shareduserstore]allItems] objectAtIndex:indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.thumbNail.image=[UIImage imageNamed:[item objectForKey:@"image"] ];
    
    cell.itemName.text=[item objectForKey:@"intro"];
    cell.itemPrice.text=[item objectForKey:@"price"];

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ItemDetailViewController *detailViewController=[[ItemDetailViewController alloc]init];
    NSArray *items=[[Itemstore shareduserstore]allItems];
    
    detailViewController.item=items[indexPath.row];
    [self.navigationController pushViewController:detailViewController animated:YES];
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int y=scrollView.contentOffset.y;
    if(y<-128)
    {
        if([[[Itemstore shareduserstore]allItems]count]==50)
        {
            self.refreshLabel.text=@"无更多数据";
        }
        else
        {
            self.refreshLabel.text=@"⬆️释放刷新";
        }
    }
    else
    {
        self.refreshLabel.text=@"⬇️下拉刷新";
    }
    
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    int y=scrollView.contentOffset.y;
    if (y<-128)
    {
        [[Itemstore shareduserstore]loadMoreItems];
    }
    [self.tableView reloadData];
    
    
}





@end
