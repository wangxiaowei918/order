//
//  LoginViewController.h
//  order
//
//  Created by 王王 on 15/7/24.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property(nonatomic,weak) IBOutlet UILabel *loginTitle;
@property(nonatomic,weak) IBOutlet UILabel *account;
@property(nonatomic,weak) IBOutlet UILabel *password;

@property(nonatomic,weak) IBOutlet UIButton *loginButton;
@property(nonatomic,weak) IBOutlet UIButton *registerButton;
@property(nonatomic,weak) IBOutlet UIButton *forgetPasswordButton;


@property(nonatomic,weak) IBOutlet UITextField *accountField;
@property(nonatomic,weak) IBOutlet UITextField *passwordField;

-(IBAction)loginAction:(id)sender;
-(IBAction)unloginandregister:(id)sender;




@end
