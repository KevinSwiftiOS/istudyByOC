//
//  MyTestViewController.h
//  istudyByOC
//
//  Created by ckq on 2019/9/21.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZNEmptyDataSet/UIScrollView+EmptyDataSet.h"
#import "MJRefresh.h"
#import <AFNetworking/AFNetworking.h>
#import "TestTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyTestViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,DZNEmptyDataSetSource>
{
    NSArray *items;
}
@property(nonatomic,weak)IBOutlet UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
