//
//  TableViewCell.h
//  动态布局cell的高度
//
//  Created by 王宏达 on 2017/3/8.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <UIKit/UIKit.h>

@class cellModel;
@interface TableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong)cellModel *model;

@end
