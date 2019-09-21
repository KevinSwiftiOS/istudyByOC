//
//  CourseDesViewController.h
//  istudyByOC
//
//  Created by ckq on 2019/9/21.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
#import <AFNetworking/AFNetworking.h>
#import "CourseDesTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface CourseDesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSArray *items;
}
//@property(weak,nonatomic)NSMutableArray *items;
@property(weak,nonatomic)IBOutlet UITableView *courseDesTableView;
@end

NS_ASSUME_NONNULL_END
