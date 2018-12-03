//
//  ViewController.m
//  CornerCellDemo
//
//  Created by apple on 2018/12/3.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "CommenList3TableViewCell.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>
@property (nonatomic ,retain) UITableView * tableView;
@property (nonatomic ,retain) NSMutableArray * dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BGGrey;
    [self addNavBtn];
    [self createTableView];
}

-(void)addNavBtn{
    UIButton *add = [UIButton buttonWithType:(UIButtonTypeContactAdd)];
    add.frame = CGRectMake(0, 0, 60, 20);
    [add addTarget:self action:@selector(addModel) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:add];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)addModel{
    DFModel *model = [[DFModel alloc]init];
    model.name = @"阿斯加德";
    model.time = @"2012";
    model.type = @"突发事件";
    [_dataSource addObject:model];
    [self.tableView reloadData];
}

-(NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        DFModel *model1 = [[DFModel alloc]init];
        model1.name = @"北京";
        model1.time = @"2013";
        model1.type = @"普通事件";
        DFModel *model2 = [[DFModel alloc]init];
        model2.name = @"天津";
        model2.time = @"2014";
        model2.type = @"紧急事件";
        DFModel *model3 = [[DFModel alloc]init];
        model3.name = @"邯郸";
        model3.time = @"2016";
        model3.type = @"紧急事件";
        DFModel *model4 = [[DFModel alloc]init];
        model4.name = @"石家庄";
        model4.time = @"2017";
        model4.type = @"普通事件";
        DFModel *model5 = [[DFModel alloc]init];
        model5.name = @"保定";
        model5.time = @"2018";
        model5.type = @"紧急事件";

        _dataSource = [NSMutableArray arrayWithArray:@[model1,model2,model3,model4,model5]];
    }
    return _dataSource;
}

- (void)createTableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = BGGrey;
    [self.view addSubview:self.tableView];
    self.tableView.frame = CGRectMake(0, 64+20, kDeviceWidth, KDeviceHeight-20);
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.dataSource.count+1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 40;
    }
    return 34;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * identifier = [NSString stringWithFormat:@"cell%ld-%ld",(long)indexPath.section,(long)indexPath.row];
    
    CommenList3TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [CommenList3TableViewCell loadInstanceFromNib];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.maxNum = self.dataSource.count;
    [cell setDataWithYJSJ:indexPath dataSource:self.dataSource];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *vc = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
