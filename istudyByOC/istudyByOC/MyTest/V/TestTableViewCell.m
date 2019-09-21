//
//  TestTableViewCell.m
//  istudyByOC
//
//  Created by ckq on 2019/9/21.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.testCourseTea.tintColor = UIColor.whiteColor;
    self.testCourseTea.textColor = UIColor.blackColor;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
