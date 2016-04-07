//
//  ViewController.m
//  0407上机问题1
//
//  Created by Lancelot on 16/4/7.
//  Copyright © 2016年 tedu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *contentArray;
    NSArray *priceArray;
    NSMutableArray *mutableprice;
}
@property (weak, nonatomic) IBOutlet UITableView *tableVIew;

@property (weak, nonatomic) IBOutlet UIImageView *allChoice;
@property (weak, nonatomic) IBOutlet UILabel *allPrice;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mutableprice = [[NSMutableArray alloc]initWithCapacity:6];
    for (int i=0; i<6; i++) {
        [mutableprice addObject:@"0"];
    }
    contentArray =[NSArray arrayWithObjects:
                   @"蒸馍纺专用面粉 50",
                   @"蒸馍纺专用面粉 50",
                   @"蒸馍纺专用面粉 50",
                   @"蒸馍纺专用面粉 50",
                   @"蒸馍纺专用面粉 50",
                   @"蒸馍纺专用面粉 50",nil];
    priceArray =[NSArray arrayWithObjects:
                 @"112.00",
                 @"700.00",
                 @"700.00",
                 @"700.00",
                 @"700.00",
                 @"700.00",nil];
    
    _tableVIew.dataSource = self;
    _tableVIew.delegate = self;
    
    [self.view addSubview:_tableVIew];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    long row = indexPath.row;
    cell.textLabel.text = [contentArray objectAtIndex:row];
    NSString *string = [NSString stringWithFormat:@"¥ %@",
                    [priceArray objectAtIndex:row]];
    cell.detailTextLabel.text = string;
    
    cell.imageView.image = [UIImage imageNamed:@"quan.png"];
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    long row = indexPath.row;
    NSString *priceStr = [priceArray objectAtIndex:row];
    //处理选中图片
//    static BOOL flag;
    UIImage *image;
    if ([[mutableprice objectAtIndex:row] isEqualToString:@"0"]==false) {
        
        image =[UIImage imageNamed:@"quan.png"];
        //处理价格
        [mutableprice replaceObjectAtIndex:row withObject:@"0"];
//        flag = !flag;
    }
    else
    {
        image =[UIImage imageNamed:@"gou.png"];
        
        [mutableprice insertObject:priceStr atIndex:row];
//        flag = !flag;
    }
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.imageView.image = image;
//    NSLog(@"%@",cell.imageView.image);
    
    
    int resultPrice =0;
    //重新处理价格
    for (int i=0; i<6; i++) {
        NSString *string = [mutableprice objectAtIndex:i];
        int price = [string intValue];
//        NSLog(@"%d",price);
        resultPrice +=price;
    }
    _allPrice.text = [NSString stringWithFormat:@"¥  %d",resultPrice];
//    //处理选中后价格
//    static int resultPrice=0;
//    long row1 = indexPath.row;
//    NSString *string = [priceArray objectAtIndex:row1];
//    int price = [string intValue];
//    if (flag) {
//        resultPrice -=price;
//        
//    }
//    else{
//        resultPrice +=price;
//    }
//    NSString *resultString = [NSString stringWithFormat:
//                              @"¥  %d",resultPrice];
//    _allPrice.text = resultString;
//
//    flag = !flag;
    
}

@end
