//
//  TableViewCell.m
//  动态布局cell的高度
//
//  Created by 王宏达 on 2017/3/8.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "TableViewCell.h"
#import "cellModel.h"
#import "Masonry.h"

@interface TableViewCell ()

@property (nonatomic, strong) UIImageView *pictureView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *desLabel;

@end

@implementation TableViewCell

- (UIImageView *)pictureView {
    if (!_pictureView) {
        _pictureView = [[UIImageView alloc] init];
    }
    return _pictureView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor redColor];
    }
    return _titleLabel;
}

- (UILabel *)desLabel {
    if (!_desLabel) {
        _desLabel = [[UILabel alloc] init];
        _desLabel.numberOfLines = 0;
        _desLabel.backgroundColor = [UIColor orangeColor];
        
    }
    return _desLabel;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"cellID";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        NSLog(@"我是新创建的newCell");
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.pictureView];
        [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.left.mas_equalTo(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(40);
        }];
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.pictureView.mas_right).with.offset(10);
            make.top.mas_equalTo(20);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(20);
        }];
        //self.desLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 90;
        [self addSubview:self.desLabel];
        [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom);
            make.left.equalTo(self.pictureView.mas_right).with.offset(10);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width - 90);
            
            //make.right.mas_equalTo(-10); 与上面那行代码效果一样
        
        }];
    }
    return self;
}

- (void)setModel:(cellModel *)model {
    _model = model;
    self.pictureView.image = [UIImage imageNamed:model.icon];
    self.titleLabel.text = model.name;
    self.desLabel.text = model.state;
    //NSLog(@"%@", self.desLabel.text);
    [self layoutIfNeeded];
    //这里很重要！！！ 因为titleLabel是位置固定并且宽高都固定的，可以计算每个cell desLabel的高度加上距离下端的间距再加上titleLabel的Y值
    CGSize size = [self.desLabel sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width - 90, MAXFLOAT)];
    model.cellHeight = CGRectGetMaxY(self.titleLabel.frame) + size.height + 20; //✅
    //之前是根据desLabel算desLabel算Y值，然后加上与cell下端的距离即为cell的高度，但是这种方法逻辑正确，实现时候复用cell会有问题，所以采取上面的方法计算
    //model.cellHeight = CGRectGetMaxY(self.desLabel.frame) + 20; ❌
    NSLog(@"cellHeight = %f", model.cellHeight);
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
