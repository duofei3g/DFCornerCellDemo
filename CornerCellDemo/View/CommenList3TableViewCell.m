
//
//  CommenList3TableViewCell.m
//  TibetWater
//
//  Created by apple on 2018/11/28.
//  Copyright © 2018年 com.lonwin. All rights reserved.
//

#import "CommenList3TableViewCell.h"
#import <objc/runtime.h>


@implementation CommenList3TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)drawRect:(CGRect)rect{
    NSIndexPath *indexPath = (NSIndexPath *) objc_getAssociatedObject(self, @"indexPath");
    if (indexPath.row == 0) {
        UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect:self.bgView.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(5, 5)];
        CAShapeLayer *layer = [[CAShapeLayer alloc]init];
        layer.frame = self.bgView.bounds;
        layer.lineWidth = 0.5;
        layer.lineCap = kCALineCapSquare;
        layer.strokeColor = borderGray.CGColor;
        layer.fillColor = FillColor.CGColor;;
        layer.path = bezier.CGPath;
        [self.bgView.layer addSublayer:layer];

    }else if (indexPath.row == _maxNum) {
        UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect:self.bgView.bounds byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight) cornerRadii:CGSizeMake(5, 5)];
        CAShapeLayer *layer = [[CAShapeLayer alloc]init];
        layer.frame = self.bgView.bounds;
        layer.path = bezier.CGPath;
        layer.lineWidth = 0.5;
        layer.lineCap = kCALineCapSquare;
        layer.strokeColor = borderGray.CGColor;
        layer.fillColor = indexPath.row%2==0?FillColor.CGColor:[UIColor whiteColor].CGColor;

        [self.bgView.layer addSublayer:layer];

    }else{
        UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect:self.bgView.bounds byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight) cornerRadii:CGSizeMake(0, 0)];
        CAShapeLayer *layer = [[CAShapeLayer alloc]init];
        layer.frame = self.bgView.bounds;
        layer.path = bezier.CGPath;
        layer.lineWidth = 0.5;
        layer.lineCap = kCALineCapSquare;
        layer.strokeColor = borderGray.CGColor;
        layer.fillColor = indexPath.row%2==0?FillColor.CGColor:[UIColor whiteColor].CGColor;
        
        [self.bgView.layer addSublayer:layer];
    }

}

-(void)setDataWithYJSJ:(NSIndexPath *)indexPath dataSource:(NSMutableArray *)dataSource{
    objc_setAssociatedObject(self, @"indexPath", indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.contentView.backgroundColor = BGGrey;

    if (indexPath.row == 0) {
        self.label1.text = @"应急事件名称";
        self.label2.text = @"发生时间";
        self.label3.text = @"事件类型";
        self.label1.font = [UIFont fontWithName:@"Helvetica-Bold"size:17];
        self.label2.font = [UIFont fontWithName:@"Helvetica-Bold"size:17];
        self.label3.font = [UIFont fontWithName:@"Helvetica-Bold"size:17];

        return;
    }
    DFModel *model = [dataSource objectAtIndex:indexPath.row-1];
    self.label1.text = model.name;
    self.label2.text = model.time;
    self.label3.text = model.type;
}



@end
