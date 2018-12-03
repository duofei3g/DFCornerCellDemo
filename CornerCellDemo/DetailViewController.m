//
//  DetailViewController.m
//  CornerCellDemo
//
//  Created by apple on 2018/12/3.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DetailViewController.h"
#import "CommenDetailCell.h"

@interface DetailViewController ()<UITableViewDelegate , UITableViewDataSource>
@property (nonatomic ,retain) UITableView * tableView;
@property (nonatomic ,retain) NSMutableArray * dataSource;

@end

@implementation DetailViewController

-(NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        DFModel *model1 = [[DFModel alloc]init];
        model1.name = @"事件名称:";
        model1.value = @"停水事件";
        DFModel *model2 = [[DFModel alloc]init];
        model2.name = @"事件类型:";
        model2.value = @"紧急";
        DFModel *model3 = [[DFModel alloc]init];
        model3.name = @"记录人:";
        model3.value = @"徐继垚";
        DFModel *model4 = [[DFModel alloc]init];
        model4.name = @"记录时间:";
        model4.value = @"2018-09-09";
        DFModel *model5 = [[DFModel alloc]init];
        model5.name = @"事件时间:";
        model5.value = @"2018-09-09 08:23";
        
        DFModel *model6 = [[DFModel alloc]init];
        model6.name = @"纪录地点:";
        model6.value = @"布达拉宫";
        DFModel *model7 = [[DFModel alloc]init];
        model7.name = @"影响供水程度:";
        model7.value = @"轻微";
        DFModel *model8 = [[DFModel alloc]init];
        model8.name = @"处理概述:";
        model8.value = @"联系相应部门";
        DFModel *model9 = [[DFModel alloc]init];
        model9.name = @"处理方式:";
        model9.value = @"紧急修复";
        DFModel *model10 = [[DFModel alloc]init];
        model10.name = @"时间等级:";
        model10.value = @"一级";
        DFModel *model11 = [[DFModel alloc]init];
        model11.name = @"效果评估:";
        model11.value = @"甲";
        _dataSource = [NSMutableArray arrayWithArray:@[model1,model2,model3,model4,model5,model6,model7,model8,model9,model10,model11]];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BGGrey;
    [self createTableView];
}


- (void)createTableView {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = BGGrey;
    [self.view addSubview:self.tableView];
    
    self.tableView.frame = CGRectMake(0, 64+10, kDeviceWidth, KDeviceHeight-64-10);
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.dataSource.count+1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 36;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * identifier = [NSString stringWithFormat:@"cell%ld-%ld",(long)indexPath.section,(long)indexPath.row];
    
    CommenDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [CommenDetailCell loadInstanceFromNib];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.maxNum = self.dataSource.count;
    [cell setDataWith:indexPath dataSource:self.dataSource];
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
