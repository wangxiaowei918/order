//
//  AboutSoftwareViewController.m
//  order
//
//  Created by 王王 on 15/7/29.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "AboutSoftwareViewController.h"

@interface AboutSoftwareViewController ()

@end

@implementation AboutSoftwareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"关于软件";
    
    NSURL *url =[NSURL URLWithString:@"http://www.baidu.com"];
    
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];
    // Do any additional setup after loading the view from its nib.
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
