//
//  PersonalViewController.m
//  istudyByOC
//
//  Created by ckq on 2019/9/20.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "PersonalViewController.h"

@interface PersonalViewController ()

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.headPortrait.image = [UIImage imageNamed:@"默认头像"];
    self.headPortrait.layer.masksToBounds = true;
    self.headPortrait.layer.cornerRadius = 50;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    //注册cell
    [self.tableView registerClass:[UITableViewCell classForCoder] forCellReuseIdentifier:@"personalCell"];
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personalCell"];
 
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"基本资料";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.imageView.image = [UIImage imageNamed:@"头像个人信息"];
            break;
        case 1:
            cell.textLabel.text = @"基本安全设置";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.imageView.image = [UIImage imageNamed:@"安全信息"];
            break;
        case 2:
            cell.textLabel.text = @"退出登录";
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.imageView.image = [UIImage imageNamed:@"退出登录"];
            break;
        default:
            break;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    NSLog(@"%d",indexPath.row);
}

-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    NSLog(@"%@",[standUserDefaults valueForKey:@"avtarurl"] != @"");
    if([userDefaults valueForKey:@"avtarurl"] != nil){
      
        [self.headPortrait sd_setImageWithURL:[userDefaults valueForKey:@"avtarurl"]];
        
     
    }
    self.userName.text = [userDefaults valueForKey:@"userName"];
    
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
