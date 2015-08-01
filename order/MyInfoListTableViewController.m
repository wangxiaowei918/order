//
//  MyInfoListTableViewController.m
//  order
//
//  Created by 王王 on 15/7/29.
//  Copyright (c) 2015年 王晓伟. All rights reserved.
//

#import "MyInfoListTableViewController.h"
#import "MyInfoListTableViewCell.h"
#import "MyInfoListTableViewCell_1.h"
#import "Userstore.h"
#import "AddressViewController.h"
#import "GenderTableViewController.h"

@interface MyInfoListTableViewController ()<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation MyInfoListTableViewController

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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


-(instancetype)init
{
    self=[super initWithStyle:UITableViewStyleGrouped];
    if(self)
    {
        self.navigationItem.title=@"我的信息";
    }
    return  self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
    {
        return 1;
    }
    else if(section==1)
    {
        return 2;
    }
    else
    {
        return  0;
    }
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        return 80;
    }
    else
    {
        return 60;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        MyInfoListTableViewCell *cell=[[MyInfoListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyInfoListTableViewCell"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.headimageview.image=[[Userstore shareduserstore]currentUser].head;
        return cell;

    }
    else if(indexPath.section==1)
    {
        MyInfoListTableViewCell_1 *cell =[[MyInfoListTableViewCell_1 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyInfoListTableViewCell_1"];
        
        if(indexPath.row==0)
        {
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            cell.info.text=@"地址管理";

        }
        else if(indexPath.row==1)
        {
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            cell.info.text=@"性别";
            cell.content.text=[[Userstore shareduserstore]currentUser].gender;
        }
        else
        {
            /*nothing*/
        }
        return  cell;
    }
    
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles: nil];
        actionSheet.tag=0;
        [actionSheet addButtonWithTitle:@"拍照"];
        [actionSheet addButtonWithTitle:@"我的相册"];
        [actionSheet addButtonWithTitle:@"取消"];
        actionSheet.destructiveButtonIndex=2;
        [actionSheet showInView:self.view];
    }
    if(indexPath.section==1)
    {
        if(indexPath.row==0)
        {
            
            AddressViewController *addrvc=[[AddressViewController alloc]init];
            [self.navigationController pushViewController:addrvc animated:YES];
        }
        else if(indexPath.row==1)
        {
            GenderTableViewController *gtvc=[[GenderTableViewController alloc]init];
            [self.navigationController pushViewController:gtvc animated:YES];
        }
        
    }
    
}



-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(actionSheet.tag==0)
    {
        switch (buttonIndex) {
            case 0:
            {
                UIImagePickerController *imagePicker=[[UIImagePickerController alloc]init];
                imagePicker.delegate=self;
                imagePicker.allowsEditing=YES;
                imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:imagePicker animated:YES completion:nil];
                break;
            }
                
            case 1:
            {
                UIImagePickerController *imagePicker=[[UIImagePickerController alloc]init];
                imagePicker.delegate=self;
                imagePicker.allowsEditing=YES;
                imagePicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:imagePicker animated:YES completion:nil];
                
                break;
                
            }
                
                
            default:
            {
                NSIndexPath *indexpath=[NSIndexPath indexPathForRow:0 inSection:0];
                [self.tableView deselectRowAtIndexPath:indexpath animated:YES];
                break;
            }
        }
    }
    

}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    [[Userstore shareduserstore]currentUser].head=image;
    [self dismissViewControllerAnimated:YES completion:NULL];
    [[Userstore shareduserstore]saveUser];
    
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
