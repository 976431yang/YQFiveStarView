//
//  DEMO5.m
//  YQFiveStarViewDemo
//
//  Created by problemchild on 16/8/19.
//  Copyright © 2016年 ProblenChild. All rights reserved.
//

#import "DEMO5.h"
#import "YQFiveStarView.h"

@interface DEMO5 ()
@property(nonatomic,strong)NSTimer *timer;

@property(nonatomic,strong)YQFiveStarView *StarView;
@end

@implementation DEMO5

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    YQFiveStarView *view = [[YQFiveStarView alloc]initWithFrame:CGRectMake(50, 200,
                                                                           [UIScreen mainScreen].bounds.size.width-100,
                                                                           50)];
    
    view.animation = YES;
    view.Score = @1;
    
    [self.view addSubview:view];
    
    self.StarView = view;
    
    //--------------------------------------------------
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(ChangeScore) userInfo:nil repeats:YES];
}

-(void)ChangeScore{
    
    float score = (rand()%500)*0.01;
    
    self.StarView.Score = [NSNumber numberWithFloat:score];
    
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.timer invalidate];
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
