//
//  CommenList3TableViewCell.h
//  TibetWater
//
//  Created by apple on 2018/11/28.
//  Copyright © 2018年 com.lonwin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "DFModel.h"
@interface CommenList3TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *bgView;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UILabel *label3;
@property (strong, nonatomic) IBOutlet UILabel *line1;
@property (strong, nonatomic) IBOutlet UILabel *line2;

@property(nonatomic,assign)NSInteger maxNum;
@property(nonatomic,strong)NSIndexPath *indexPath;
@property(nonatomic,strong)NSMutableArray *dataSource;

//应急事件
-(void)setDataWithYJSJ:(NSIndexPath *)indexPath dataSource:(NSMutableArray *)dataSource;

@end
