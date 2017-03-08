//
//  cellModel.m
//  动态布局cell的高度
//
//  Created by 王宏达 on 2017/3/8.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "cellModel.h"

@implementation cellModel

+ (NSArray *)loadData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"industry" ofType:@"plist"];
    NSArray *itemsArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSDictionary *dict in itemsArray) {
        cellModel *model = [[cellModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        [dataArray addObject:model];
    }
    return dataArray;
}

@end
