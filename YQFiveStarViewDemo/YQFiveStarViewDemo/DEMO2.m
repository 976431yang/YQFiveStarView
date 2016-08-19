//
//  DEMO2.m
//  YQFiveStarViewDemo
//
//  Created by problemchild on 16/8/19.
//  Copyright © 2016年 ProblenChild. All rights reserved.
//

#import "DEMO2.h"
#import "YQFiveStarView.h"

@interface DEMO2 ()

@end

@implementation DEMO2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    YQFiveStarView *view = [[YQFiveStarView alloc]initWithFrame:CGRectMake(50, 200,
                                                                           [UIScreen mainScreen].bounds.size.width-100,
                                                                           50)];
    view.canChoose = YES;
    view.starImage_Full = [UIImage imageNamed:@"img1.png"];
    view.starImage_Empty = [UIImage imageNamed:@"img2.png"];
    
    [self.view addSubview:view];
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
