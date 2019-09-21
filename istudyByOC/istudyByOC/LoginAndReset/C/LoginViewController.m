//
//  LoginViewController.m
//  istudyByOC
//
//  Created by ckq on 2019/9/19.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
//    [XKeyBoard registerKeyBoardShow:self];
//    [XKeyBoard registerKeyBoardHide:self];
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [[UIColor alloc]initWithRed:255.0 green:255.0 blue:255.0 alpha:1.0];
    self.navigationController.navigationBar.tintColor = UIColor.blackColor;
    [self.ForgetPasswordBtn addTarget:self action:@selector(forgetBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.LoginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Do any additional setup after loading the view.
}
-(void)forgetBtn:(UIButton *)btn{
   
}
-(void)login:(UIButton *)btn{

    NSString *userName =  self.UserNameTextField.text;
    NSString *password = self.passWordTextField.text;
   
    NSDictionary *parameters = @{@"username":userName,
                                 @"password":password,
                                 @"devicetoken":@"",
                                 @"os":@"",
                                 @"clienttype":@"1"
                                 };
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [ProgressHUD show:@"请稍候"];
    [manager POST: @"http://dodo.hznu.edu.cn/api/login" parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       // [ProgressHUD dismiss];
        NSLog(@"%@",responseObject);
        if(([responseObject[@"retcode"] intValue]) == 0){
        //设置userDefaults
            [self setUserDefaultsValue:responseObject[@"authtoken"] key:@"authtoken"];
            [self setUserDefaultsValue:userName key:@"userName"];
            [self setUserDefaultsValue:password key:@"passWord"];
            [self setUserDefaultsValue:responseObject[@"info"][@"name"]  key:@"name"];
            [self setUserDefaultsValue:responseObject[@"info"][@"gender"]  key:@"gender"];
            [self setUserDefaultsValue:responseObject[@"info"][@"cls"]  key:@"cls"];
      
        
           [self setUserDefaultsValue:responseObject[@"info"][@"phone"] key:@"phone"];
            [self setUserDefaultsValue:responseObject[@"info"][@"email"] key: @"email"];
        //qq 邮编 地址栏的设置
             [self setUserDefaultsValue:responseObject[@"info"][@"addr"] key: @"address"];
        [self setUserDefaultsValue:responseObject[@"info"][@"qq"] key: @"QQNumber"];
        [self setUserDefaultsValue:responseObject[@"info"][@"zipcode"] key: @"postCode"];

        //设置头像
            [self setUserDefaultsValue:responseObject[@"info"][@"avtarurl"] key: @"avtarurl"];
        
        
        
        
        
        UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UITabBarController *tabBatVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"tabBarVC"];
        [self presentViewController:tabBatVC animated:true completion:nil];
        }else{
           
            [ProgressHUD showError:@"登录失败"];

        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         [ProgressHUD showError:@"登录失败"];
    }];
  
    
}
- (IBAction)touchUp:(UIControl *)sender {

    [self.UserNameTextField resignFirstResponder];
    [self.passWordTextField resignFirstResponder];
}
    -(void)setUserDefaultsValue:(NSString *)value key:(NSString *)key{
     NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if([value isKindOfClass:[NSNull class]]){
     
        [userDefaults setValue:nil forKey:key] ;
   
       
    }else{
        [userDefaults setValue:value forKey:key];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)viewWillDisappear:(BOOL)animated{
    [ProgressHUD dismiss];
}
@end
