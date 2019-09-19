//
//  LoginViewController.h
//  istudyByOC
//
//  Created by ckq on 2019/9/19.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "XKeyBoard.h"
#import "ProgressHUD.h"
NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;
@property (weak, nonatomic) IBOutlet UIButton *ForgetPasswordBtn;
@property (weak, nonatomic) IBOutlet UITextField *UserNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;

@end

NS_ASSUME_NONNULL_END
