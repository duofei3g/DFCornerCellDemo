//
//  CommenDetailCell.h
//  TibetWater
//
//  Created by apple on 2018/11/30.
//  Copyright © 2018年 com.lonwin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommenDetailCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *bgView;
@property (strong, nonatomic) IBOutlet UIImageView *IMG;
@property (strong, nonatomic) IBOutlet UILabel *title_LB;
@property (strong, nonatomic) IBOutlet UILabel *key_LB;
@property (strong, nonatomic) IBOutlet UILabel *line;
@property (strong, nonatomic) IBOutlet UILabel *value_LB;


@property(nonatomic,assign)NSInteger maxNum;
@property(nonatomic,strong)NSIndexPath *indexPath;
@property(nonatomic,strong)NSMutableArray *dataSource;

-(void)setDataWith:(NSIndexPath *)indexPath dataSource:(NSMutableArray *)dataSource;
@end
