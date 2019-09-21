//
//  TestTableViewCell.h
//  istudyByOC
//
//  Created by ckq on 2019/9/21.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestTableViewCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UILabel *testCourseNameLabel;
@property(nonatomic,weak)IBOutlet UILabel *testCourseTimeLabel;
@property(nonatomic,weak)IBOutlet UILabel *testCourseTea;
@end

NS_ASSUME_NONNULL_END
