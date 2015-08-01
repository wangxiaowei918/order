//
//  ItemDetailViewController.m
//  order
//
//  Created by 王王 on 15/7/28.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "MyOrderItemStore.h"

@interface ItemDetailViewController ()

@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UITextView  *introView;
@property(nonatomic,strong) UIButton    *order;
@property(nonatomic,strong) UILabel     *priceString;
@end

@implementation ItemDetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 50, 300, 300)];
    self.introView=[[UITextView alloc]initWithFrame:CGRectMake(10, 360, 300, 110)];
    UIFont *font1=[UIFont systemFontOfSize:20];
    self.introView.font=font1;
    
    
    
    self.order=[UIButton buttonWithType:UIButtonTypeSystem];
    [self.order setTitle:@"加入购物车" forState:UIControlStateNormal];
    self.order.frame=CGRectMake(120, 480, 180, 30);
    UIFont *font2=[UIFont systemFontOfSize:20];
    self.order.titleLabel.font=font2;
    //self.order.titleLabel.textColor=[UIColor redColor];
    [self.order setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.order.backgroundColor=[UIColor redColor];
    
    [self.order addTarget:self action:@selector(addThisItem) forControlEvents:UIControlEventTouchUpInside];
    
    self.priceString=[[UILabel alloc]initWithFrame:CGRectMake(10, 480, 100, 30)];
    UIFont *font3=[UIFont systemFontOfSize:20];
    self.priceString.font=font3;
    
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.introView];
    [self.view addSubview:self.order];
    [self.view addSubview:self.priceString];
    // Do any additional setup after loading the view.
}


-(void)addThisItem
{
    for(Item *obj in [[MyOrderItemStore sharedMyOrderStore]MyOrders])
    {
        if([obj.descrip isEqualToString:self.introView.text])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry"  message:@"已添加该物品" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            
            [alert show];
            return;
        }
    }
        
    Item *add=[[MyOrderItemStore  sharedMyOrderStore]createItem];
    add.descrip=self.introView.text;
    add.pricestring=self.priceString.text;
    add.itemImage=self.imageView.image;
    add.number=1;
    [[MyOrderItemStore sharedMyOrderStore]saveOrders];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSDictionary *item = self.item;
    
    self.introView.text = [item objectForKey:@"intro"];
    
    self.imageView.image= [UIImage imageNamed:[item objectForKey:@"image"]];
    self.priceString.text=[item objectForKey:@"price"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
