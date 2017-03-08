//
//  ViewController.m
//  动态布局cell的高度
//
//  Created by 王宏达 on 2017/3/8.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "ViewController.h"
#import "cellModel.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataList;

@end

@implementation ViewController

- (NSArray *)dataList {
    if (!_dataList) {
        _dataList = [cellModel loadData];
    }
    return _dataList;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //设置线顶头
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [TableViewCell cellWithTableView:tableView];
    cell.model = self.dataList[indexPath.row];
    NSLog(@"%li --------- %@", indexPath.row, cell.reuseIdentifier);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cellModel *model = self.dataList[indexPath.row];
    //NSLog(@"%@", model.state);
    //NSLog(@"%li ---- %f", indexPath.row, model.cellHeight);
    
    return model.cellHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
