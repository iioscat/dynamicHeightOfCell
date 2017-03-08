//
//  cellModel.h
//  动态布局cell的高度
//
//  Created by 王宏达 on 2017/3/8.
//  Copyright © 2017年 王宏达. All rights reserved.
//

//Foundation/Foundation.h 需要改为 UIKit/UIKit.h 才可以声明CGFloat
#import <UIKit/UIKit.h>

@interface cellModel : NSObject

@property (nonatomic, copy)   NSString *icon;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *state;
@property (nonatomic, assign) CGFloat   cellHeight;

+ (NSArray *)loadData;



@end
