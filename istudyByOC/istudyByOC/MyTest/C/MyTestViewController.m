//
//  MyTestViewController.m
//  istudyByOC
//
//  Created by ckq on 2019/9/21.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "MyTestViewController.h"

@interface MyTestViewController ()

@end

@implementation MyTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector((headerRfresh))];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.emptyDataSetSource = self;
    
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
    
    [manager POST:@"http://dodo.hznu.edu.cn/api/testquery" parameters:parameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self -> items = responseObject[@"items"];
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return items.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testTableViewCell"];
    cell.testCourseNameLabel.text = [@"考试科目" stringByAppendingString: [items[indexPath.row] valueForKey:@"title"]];
    cell.testCourseTea.text = [items[indexPath.row] valueForKey:@"teacher"];
    NSMutableArray *dateStartArr = [[NSMutableArray alloc]init];
    NSMutableArray *dateEndArr = [[NSMutableArray alloc]init];
    dateStartArr = [self diviseDateString:[items[indexPath.row] valueForKey:@"datestart"]];
    dateEndArr = [self diviseDateString:[items[indexPath.row] valueForKey:@"dateend"]];
    cell.testCourseTimeLabel.text = [@"开始时间" stringByAppendingString:dateStartArr[0]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSString *string = @"暂无考试信息";
    NSDictionary *dic = @{NSFontAttributeName:
                              [UIFont boldSystemFontOfSize:18.0],
                          
                          NSForegroundColorAttributeName:UIColor.grayColor
                          };
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc]initWithString:string attributes:dic];
    return attriString;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSMutableArray *)diviseDateString:(NSString *)totalDate{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    NSRange yearRange = NSMakeRange(0, 4);
     NSRange monthRange = NSMakeRange(4, 2);
     NSRange dateRange = NSMakeRange(6, 2);
     NSRange hourRange = NSMakeRange(8, 2);
     NSRange minuateRange = NSMakeRange(10, 2);
     NSRange secondRange = NSMakeRange(2, 2);
     [arr addObject:[totalDate substringWithRange:yearRange]];
  [arr addObject:[totalDate substringWithRange:monthRange]];
    [arr addObject: [totalDate substringWithRange:dateRange]];
  [arr addObject:[totalDate substringWithRange:hourRange]];
     [arr addObject:[totalDate substringWithRange:minuateRange]];
      [arr addObject: [totalDate substringWithRange:secondRange]];

    return arr;
    
}
@end
