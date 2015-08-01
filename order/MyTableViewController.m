//
//  MyTableViewController.m
//  order
//
//  Created by 王王 on 15/7/28.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyInfoTableViewCell.h"
#import "MyOrderTableViewCell.h"
#import "MyInfoListTableViewController.h"
#import "Userstore.h"
#import "AppDelegate.h"
#import "ItemTableViewController.h"
#import "AboutSoftwareViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "MyOrderListTableViewController.h"
#import "LoginViewController.h"
//#import "logoutViewController.h"

        
@interface MyTableViewController ()<UIActionSheetDelegate,UIAlertViewDelegate>

@property(nonatomic,strong) ACAccountStore* accountStore;
@property(nonatomic,strong) ACAccountType*  twitterAccountType;

@property(nonatomic,strong)SLComposeViewController *composeVC;

@end

@implementation MyTableViewController


-(instancetype)init
{
    self=[super initWithStyle:UITableViewStyleGrouped];
    if(self)
    {
        self.navigationItem.title=@"我的";
        
    }
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *rbbi=[[UIBarButtonItem alloc]initWithTitle:@"更多" style:UIBarButtonItemStylePlain target:self action:@selector(moreinfo)];
    
    
    self.navigationItem.rightBarButtonItem=rbbi;
    
    UIBarButtonItem *lbbi=[[UIBarButtonItem alloc]initWithTitle:@"退出登录" style:UIBarButtonItemStylePlain target:self action:@selector(readylogout)];
    
    
    self.navigationItem.leftBarButtonItem=lbbi;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(section==0)
    {
        return 1;
    }
    else if(section ==1)
    {
        return 1;
    }
    else
    {
        return 1;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section==0)
    {
        return @"我的信息";
    }
    else
    {
        return  @"我的订单";
    }
    return  nil;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        return 80;
    }
    else if (indexPath.section==1)
    {
        return 60;
    }
    else
    {
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        MyInfoTableViewCell *cell=[[MyInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyInfoTableViewCell"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.headView.image=[[Userstore shareduserstore]currentUser].head;
        return cell;
    }
    else if(indexPath.section==1)
    {
        MyOrderTableViewCell *cell=[[MyOrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyOrderTableViewCell"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        return cell;

    }
    else
    {
        return nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        MyInfoListTableViewController *miltvc=[[MyInfoListTableViewController alloc]init];
        [self.navigationController pushViewController:miltvc animated:YES];
    }
    else if(indexPath.section==1)
    {
        MyOrderListTableViewController *moltvc=[[MyOrderListTableViewController alloc]init];
        [self.navigationController pushViewController:moltvc animated:YES];
    }
    else
    {
        /*do nothing*/
    }
}

-(void)readylogout
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"确定退出？" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alert show];
    
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1)
    {
        [self logout];
    }
}

-(void)logout
{
    
    [Userstore shareduserstore].currentUser=nil;
    [[Userstore shareduserstore]saveUser];
    AppDelegate *appdelegate=[[UIApplication sharedApplication]delegate];
    
    
    appdelegate.loginVC=[[LoginViewController alloc]init];
    appdelegate.window.rootViewController=appdelegate.loginVC;
    
    UINavigationController *navMain=[[UINavigationController alloc]initWithRootViewController:[[ItemTableViewController alloc]init]];
    
    navMain.tabBarItem.title=@"主页";
    navMain.tabBarItem.image=[UIImage imageNamed:@"home"];
    
    UINavigationController *navUserpage=[[UINavigationController alloc]initWithRootViewController:[[MyTableViewController alloc]init]];
    
    navUserpage.tabBarItem.title=@"我的";
    navUserpage.tabBarItem.image=[UIImage imageNamed:@"me"];
    appdelegate.tvc=[[UITabBarController alloc]init];
    appdelegate.tvc.viewControllers=@[navMain,navUserpage];

    
    
    return;

}


-(void)moreinfo
{
    
    UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles: nil];
    
    [actionSheet addButtonWithTitle:@"分享"];
    [actionSheet addButtonWithTitle:@"关于软件"];
    [actionSheet addButtonWithTitle:@"取消"];
    actionSheet.destructiveButtonIndex=2;
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    switch (buttonIndex) {
        case 0:
        {
            {
                SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
                    //dismiss the view controller
                    [self.composeVC dismissViewControllerAnimated:YES completion:nil];
                    switch(result){
                        case SLComposeViewControllerResultCancelled:
                        {
                            break;
                        }
                            
                        case SLComposeViewControllerResultDone:
                        {
                            break;
                            /*send ok*/
                        }
                        default:
                        {
                            break;
                        }

                    }};
                

                self.composeVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
                // Configure the compose View Controller
                [self.composeVC setInitialText:@"from my order"];
                [self.composeVC setCompletionHandler:completionHandler];
                
                [self.navigationController presentViewController:self.composeVC animated:YES completion:nil];
# if 0
                ACAccountStore *accountstore=[[ACAccountStore alloc] init];
                ACAccountType *accountType=[accountstore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierSinaWeibo];
                
                
                NSDictionary* options = nil;
                [accountstore requestAccessToAccountsWithType:accountType options:options
                                                        completion:^(BOOL granted, NSError *error)
                 {
                     if(granted==YES)
                     {
                         
                     }
                 }];
                
                SLRequestHandler requestHandler =
                ^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                    if (responseData) {
                        NSInteger statusCode = urlResponse.statusCode;
                        if (statusCode >= 200 && statusCode < 300) {
                            /*send ok*/
                        }
                        else {
                            /*send error*/
                        }
                    }
                    else {
                        /*send error*/
                    }
                };
                ACAccount *account=[[accountstore accountsWithAccountType:accountType]objectAtIndex:0];
                
                NSDictionary* message = @{@"status": @"send weibo from my order"};
                NSURL* requestURL = [NSURL
                                     URLWithString:@"https://api.weibo.com/2/statuses/update.json"];
                
                SLRequest* postRequest = [SLRequest
                                          requestForServiceType:SLServiceTypeSinaWeibo
                                          requestMethod:SLRequestMethodPOST
                                          URL:requestURL parameters:message];
                postRequest.account = account;
                [postRequest performRequestWithHandler:requestHandler];
#endif

            }

            break;
        }
            
        case 1:
        {
            AboutSoftwareViewController *absvc=[[AboutSoftwareViewController alloc]init];
            [self.navigationController pushViewController:absvc animated:YES];
            break;
        }
        default:
        {
            break;
        }
    }
}


@end
