//
//  AddressViewController.m
//  order
//
//  Created by 王王 on 15/7/30.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "AddressViewController.h"
#import "Userstore.h"


@interface AddressViewController ()<UITextViewDelegate>
@property (nonatomic,strong) UITextView *addressTextView;
@property (nonatomic,strong) UIButton *saveAddress;


@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"地址管理";
    self.addressTextView=[[UITextView alloc]initWithFrame:CGRectMake(10, 80, 300, 160)];
    [self.view addSubview:self.addressTextView];
    self.addressTextView.delegate=self;
    self.addressTextView.font = [UIFont fontWithName:@"Arial" size:18.0];
    self.addressTextView.layer.borderColor = [UIColor grayColor].CGColor;
    self.addressTextView.layer.borderWidth =1.0;
    self.addressTextView.layer.cornerRadius =5.0;
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.addressTextView.text = @"西小口东升科技园";
    
    
    self.saveAddress=[UIButton buttonWithType:UIButtonTypeSystem];
    [self.saveAddress setTitle:@"保存地址" forState:UIControlStateNormal];
    self.saveAddress.frame=CGRectMake(10, 480, 300, 30);
    UIFont *font2=[UIFont systemFontOfSize:20];
    self.saveAddress.titleLabel.font=font2;
    //self.order.titleLabel.textColor=[UIColor redColor];
    [self.saveAddress setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.saveAddress.backgroundColor=[UIColor redColor];
    
    [self.saveAddress addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.saveAddress];
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.addressTextView.text=[[Userstore shareduserstore]currentUser].address;
}

-(void)save
{
    NSLog(@"%@",self.addressTextView.text);
    [[Userstore shareduserstore]currentUser].address=self.addressTextView.text;
    [[Userstore shareduserstore]saveUser];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{return  YES;}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"ssssss");
    [self.addressTextView resignFirstResponder];
    return;
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
