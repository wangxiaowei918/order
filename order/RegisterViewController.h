//
//  RegisterViewController.h
//  order
//
//  Created by 王王 on 15/7/24.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property(nonatomic,weak) IBOutlet UILabel *registerTtile;

@property(nonatomic,weak) IBOutlet UITextField *accountField;
@property(nonatomic,weak) IBOutlet UITextField *passwordField;

@property(nonatomic,weak) IBOutlet UIButton *registerButton;
@property(nonatomic,weak) IBOutlet UIButton *cancelButton;
@property(nonatomic,weak) IBOutlet UILabel *test;


-(IBAction)registerAction:(id)sender;
-(IBAction)cancelAction:(id)sender;


@end
