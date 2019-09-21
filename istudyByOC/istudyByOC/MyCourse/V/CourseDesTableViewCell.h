//
//  CourseDesTableViewCell.h
//  istudyByOC
//
//  Created by ckq on 2019/9/21.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CourseDesTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *courseNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *courseTeaLabel;
@property (weak, nonatomic) IBOutlet UIButton *studyCourseBtn;

@end

NS_ASSUME_NONNULL_END
