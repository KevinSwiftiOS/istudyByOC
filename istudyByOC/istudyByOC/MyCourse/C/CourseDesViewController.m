//
//  CourseDesViewController.m
//  istudyByOC
//
//  Created by ckq on 2019/9/21.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "CourseDesViewController.h"

@interface CourseDesViewController ()

@end

@implementation CourseDesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.courseDesTableView.delegate = self;
    self.courseDesTableView.dataSource = self;
    self.courseDesTableView.tableFooterView = [[UIView alloc]init];
    self.courseDesTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector((headerRfresh))];
    [self.courseDesTableView.mj_header beginRefreshing];
    // Do any additional setup after loading the view.
}
-(void)headerRfresh{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *parameter = @{
                                @"authtoken":[userDefaults valueForKey:@"authtoken"]
                                };
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
   
    [manager POST:@"http://dodo.hznu.edu.cn/api/coursequery" parameters:parameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self -> items = responseObject[@"items"];
        [self.courseDesTableView.mj_header endRefreshing];
        [self.courseDesTableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  items.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CourseDesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"courseDesCell"];
    cell.studyCourseBtn.layer.cornerRadius = 5.0;
    cell.studyCourseBtn.layer.masksToBounds = true;
    cell.studyCourseBtn.tag = indexPath.row;
    [cell.studyCourseBtn addTarget:self action:@selector(pushNewVC:) forControlEvents:UIControlEventTouchUpInside];
    cell.courseNameLabel.text = [items[indexPath.row] valueForKey:@"title"];
    cell.courseTeaLabel.text = [items[indexPath.row] valueForKey:@"teacher"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)pushNewVC:(UIButton *)btn{
    NSLog(@"%@",items[btn.tag][@"title"]);
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
