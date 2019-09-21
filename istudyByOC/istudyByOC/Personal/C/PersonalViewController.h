//
//  PersonalViewController.h
//  istudyByOC
//
//  Created by ckq on 2019/9/20.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
NS_ASSUME_NONNULL_BEGIN

@interface PersonalViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *headPortrait;
@property (weak, nonatomic) IBOutlet UILabel *userName;

@end

NS_ASSUME_NONNULL_END
