//
//  MyOrderListTableTableViewController.m
//  order
//
//  Created by 王王 on 15/7/29.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "MyOrderListTableViewController.h"
#import "MyOrderListTableViewCell.h"
#import "MyOrderItemStore.h"
#import "Userstore.h"


@interface MyOrderListTableViewController ()

@end

@implementation MyOrderListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gotoPay=[UIButton buttonWithType:UIButtonTypeSystem];
    
    NSString *str=[NSString stringWithFormat:@"合计：¥%.2f  去结算",[self payConpute]];
    
    [self.gotoPay setTitle:str forState:UIControlStateNormal];
    //self.gotoPay.frame=CGRectMake(0, 410, 320, 80);
    UIFont *font2=[UIFont systemFontOfSize:20];
    self.gotoPay.titleLabel.font=font2;
    //self.order.titleLabel.textColor=[UIColor redColor];
    [self.gotoPay setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.gotoPay.backgroundColor=[UIColor redColor];
    
    [self.gotoPay addTarget:self action:@selector(payed) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    NSString *str=[NSString stringWithFormat:@"合计：¥%.2f  去结算",[self payConpute]];
    [self.gotoPay setTitle:str forState:UIControlStateNormal];
}


-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.gotoPay;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @" ";
}

-(float)tableView:(UITableView *)tableView heightForHearderInSection:(NSInteger)section
{
    return 100;
}

-(instancetype)init
{
    self=[super initWithStyle:UITableViewStylePlain];
    if(self)
    {
        self.navigationItem.title=@"我的物品";
    }
    return  self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  80;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [[[MyOrderItemStore sharedMyOrderStore]MyOrders]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellname = @"MyOrderListTableViewCell";
    MyOrderListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellname];
    if (cell == nil) {
        cell = [[MyOrderListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
    }
    
    Item *item=[[[MyOrderItemStore sharedMyOrderStore]MyOrders] objectAtIndex:indexPath.row];
    
    cell.thumbNail.image=item.itemImage;
    cell.itemName.text=item.descrip;
    cell.itemPrice.text=item.pricestring;
    cell.numberLabel.text=[NSString stringWithFormat:@"%d",item.number];
    
    
    __weak typeof(self) weakself=self;
    cell.minusAction = ^{
        if(item.number>1)
        {
            item.number--;
            
        }
        NSString *str=[NSString stringWithFormat:@"合计：¥%.2f  去结算",[weakself payConpute]];
        [weakself.gotoPay setTitle:str forState:UIControlStateNormal];
    };
    
    cell.addAction=^{
        item.number++;
        
        NSString *str=[NSString stringWithFormat:@"合计：¥%.2f  去结算",[weakself payConpute]];
        [weakself.gotoPay setTitle:str forState:UIControlStateNormal];
    };
    
    return cell;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle==UITableViewCellEditingStyleDelete)
    {
        [[MyOrderItemStore sharedMyOrderStore]removeItem:indexPath.row];
        [[MyOrderItemStore sharedMyOrderStore]saveOrders];
        
        NSString *str=[NSString stringWithFormat:@"合计：¥%.2f  去结算",[self payConpute]];
        [self.gotoPay setTitle:str forState:UIControlStateNormal];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(float)payConpute
{
    float sum=0.0;
    for(Item *obj in [[MyOrderItemStore sharedMyOrderStore]MyOrders])
    {
        NSString *price=[obj.pricestring substringFromIndex:1];
        float value=[price floatValue];
        int number=obj.number;
        //NSLog(@"%@ %d %f %@",price,number,value,obj.pricestring);
        sum+=value*number;
    }
    return  sum;
}

-(void)payed
{
    NSString *str=[NSString stringWithFormat:@"已付：¥%.2f",[self payConpute]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"恭喜您！"  message:str delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [alert show];
    return;

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
