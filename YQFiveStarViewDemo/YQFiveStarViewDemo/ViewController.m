//
//  ViewController.m
//  YQFiveStarViewDemo
//
//  Created by problemchild on 16/8/19.
//  Copyright © 2016年 ProblenChild. All rights reserved.
//

#import "ViewController.h"

#import "DEMO1.h"
#import "DEMO2.h"
#import "DEMO3.h"
#import "DEMO4.h"
#import "DEMO5.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tabV;
@end

@implementation ViewController

#pragma mark --------LazyLoad



#pragma mark --------System

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


#pragma mark --------Functions
-(void)setup{
    
    self.title = @"YQFiveStarView";
    
    self.tabV = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tabV.delegate = self;
    self.tabV.dataSource = self;
    
    [self.view addSubview:self.tabV];
    
    //注册重用单元格
    [self.tabV registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyCell"];
}

#pragma mark --------UITableViewDataSource,UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //自动从重用队列中取得名称是MyCell的注册对象,如果没有，就会生成一个
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    
    //清除cell上的原有view
    NSArray *subviews = [[NSArray alloc] initWithArray:cell.contentView.subviews];
    for (UIView *subview in subviews) {
        [subview removeFromSuperview];
    }
    //cell的设置
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"可点击";
            break;
        case 1:
            cell.textLabel.text = @"可点击 -- 更改图标";
            break;
        case 2:
            cell.textLabel.text = @"可点击 -- 开启动画";
            break;
        case 3:
            cell.textLabel.text = @"不可点击 -- 只展示";
            break;
        case 4:
            cell.textLabel.text = @"不可点击 -- 只展示 -- 开启动画";
            break;
            
        default:
            break;
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[DEMO1 new] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[DEMO2 new] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[DEMO3 new] animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:[DEMO4 new] animated:YES];
            break;
        case 4:
            [self.navigationController pushViewController:[DEMO5 new] animated:YES];
            break;
            
        default:
            break;
    }
}
@end
