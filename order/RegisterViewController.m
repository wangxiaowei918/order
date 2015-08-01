//
//  RegisterViewController.m
//  order
//
//  Created by 王王 on 15/7/24.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "RegisterViewController.h"
//#import "KeychainItemWrapper.h"
#import "Userstore.h"
#import "User.h"

@interface RegisterViewController ()<UITextFieldDelegate>

@end

@implementation RegisterViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    self.passwordField.secureTextEntry=YES;
    self.accountField.delegate=self;
    self.passwordField.delegate=self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            [self.registerButton  setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.registerButton.backgroundColor=[UIColor redColor];
            
        }
        if((textField.text.length==1)&&(string.length==0))
        {
            [self.registerButton  setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            self.registerButton.backgroundColor=[UIColor whiteColor];
            
        }
    }
    return YES;
    
}

-(IBAction)registerAction:(id)sender
{
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
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry"  message:@"该用户已注册" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            
            [alert show];
            return;
        }
    }

    User *user1=[[Userstore shareduserstore] createRegisteredUser];
    user1.username=self.accountField.text;
    user1.password=self.passwordField.text;
    user1.isLogged=NO;
    user1.gender=@"保密";
    user1.address=@"";
    user1.head=[UIImage imageNamed:@"defaulthead.jpg"];
    user1.MyOrderItemStore=[MyOrderItemStore sharedMyOrderStore];
    /*存到userdefaults*/
    [[Userstore shareduserstore]saveUser];
        
    /*转到登陆页面*/
    [self dismissViewControllerAnimated:YES completion:nil];
    
    return;
}



-(IBAction)cancelAction:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
#if 0
    self.test.text=@"";
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    
    NSData* data  = [defaults objectForKey:@"currentuser"];
    
    
    NSData *currentUserData=[defaults objectForKey:@"currentuser"];
    User* user=[NSKeyedUnarchiver unarchiveObjectWithData:currentUserData];
    self.test.text=[self.test.text stringByAppendingString:user.username];
    
#endif
    
#if 0
    NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    for(User* obj in oldSavedArray)
    {
        NSLog(@"%@, %@  %d", obj.username, obj.password,obj.isLogged);
        //[self.test.text stringByAppendingString:obj.username];
        self.test.text=[self.test.text stringByAppendingString:obj.username];
        
    }
#endif
    
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
