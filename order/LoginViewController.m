//
//  LoginViewController.m
//  order
//
//  Created by 王王 on 15/7/24.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "MyTableViewController.h"
#import "User.h"
#import "Userstore.h"
#import "ItemTableViewController.h"
#import "UserPageTableViewController.h"
@interface LoginViewController () <UITextFieldDelegate>

@end

@implementation LoginViewController




- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIImage *image=[UIImage imageNamed:@"test1.jpg"];
    
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, 320, 111)];//170
    imageview.image=image;
    [self.view addSubview:imageview];
    
    self.accountField.placeholder=@"用户名/手机号码";
    self.passwordField.placeholder=@"请输入密码";
    self.passwordField.secureTextEntry=YES;
    self.accountField.delegate=self;
    self.passwordField.delegate=self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.loginButton  setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.loginButton.backgroundColor=[UIColor whiteColor];
    
    User *user=[Userstore shareduserstore].currentUser;
    NSLog(@"1111111");
    if(user)
    {
        NSLog(@"22222222");
        self.accountField.text=user.username;
        self.passwordField.text=user.password;
        [self.loginButton  setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.loginButton.backgroundColor=[UIColor redColor];
    }
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"^^^^^^^^");
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  YES;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.accountField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField==self.passwordField)
    {
        if((textField.text.length==0)&&(string.length!=0))
        {
            [self.loginButton  setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.loginButton.backgroundColor=[UIColor redColor];
            
        }
        if((textField.text.length==1)&&(string.length==0))
        {
            [self.loginButton  setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            self.loginButton.backgroundColor=[UIColor whiteColor];
        }
    }
    return YES;
    
}


-(IBAction)loginAction:(id)sender
{
    NSLog(@"dsfafdaf");
    BOOL isRegistered=NO;
    if ([self.accountField.text length]== 0 )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry"  message:@"请输入用户名" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [alert show];
        return;
    }
    
    if ([self.passwordField.text length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry"  message:@"请输入密码" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [alert show];
        return;
    }
    
    
    
    for(User* obj in [[Userstore shareduserstore]allUsers])
    {
        if([self.accountField.text isEqualToString:obj.username])
        {
            isRegistered=YES;
            if([self.passwordField.text isEqualToString:obj.password])
            {
                [Userstore shareduserstore].currentUser=obj;
                [Userstore shareduserstore].currentUser.isLogged=YES;
                [[Userstore shareduserstore]saveUser];
                /*登录成功，进入主页*/
                
                AppDelegate *appdelegate=[[UIApplication sharedApplication]delegate];
                
                UINavigationController *navMain=[[UINavigationController alloc]initWithRootViewController:[[ItemTableViewController alloc]init]];
                
                navMain.tabBarItem.title=@"主页";
                navMain.tabBarItem.image=[UIImage imageNamed:@"home"];
                
                UINavigationController *navUserpage=[[UINavigationController alloc]initWithRootViewController:[[MyTableViewController alloc]init]];
                
                navUserpage.tabBarItem.title=@"我的";
                navUserpage.tabBarItem.image=[UIImage imageNamed:@"me"];
                appdelegate.tvc=[[UITabBarController alloc]init];
                appdelegate.tvc.viewControllers=@[navMain,navUserpage];
                
                appdelegate.window.rootViewController=appdelegate.tvc;
                                
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry"  message:@"密码不正确" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                
                [alert show];
                return;
            }
        }
    }
    
    if(isRegistered==NO)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry"  message:@"用户未注册" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [alert show];
        return;
    }
}



-(IBAction)unloginandregister:(id)sender
{
    RegisterViewController *rvc=[[RegisterViewController alloc]init];
    
    [self presentViewController:rvc animated:YES completion:nil];
    
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
