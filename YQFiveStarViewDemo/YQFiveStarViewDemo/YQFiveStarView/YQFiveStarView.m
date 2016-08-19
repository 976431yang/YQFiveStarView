//
//  YQFivewStarView.m
//  YQFiveStarViewDemo
//
//  Created by problemchild on 16/8/18.
//  Copyright © 2016年 ProblenChild. All rights reserved.
//

#import "YQFiveStarView.h"

@interface YQFiveStarView ()

@property(nonatomic,strong)UIView *FullMaskView;

@property(nonatomic)float starWidth;
@property(nonatomic)float mid;

@end

@implementation YQFiveStarView

-(NSNumber *)Score{
    if(!_Score){
        _Score = @5;
    }
    return _Score;
}

-(void)setScore:(NSNumber *)Score{
    _Score = Score;
    
    int starCount = Score.intValue;
    float others = Score.floatValue - starCount;
    
    float width = starCount * (self.starWidth + self.mid);
    
    if(others>0){
        width += (others * self.starWidth);
    }
    if(self.animation){
        [UIView animateWithDuration:0.3 animations:^{
            self.FullMaskView.frame = CGRectMake(self.FullMaskView.frame.origin.x,
                                                 self.FullMaskView.frame.origin.y,
                                                 width,
                                                 self.FullMaskView.frame.size.height);
        }];
    }else{
        self.FullMaskView.frame = CGRectMake(self.FullMaskView.frame.origin.x,
                                             self.FullMaskView.frame.origin.y,
                                             width,
                                             self.FullMaskView.frame.size.height);
    }
}

-(BOOL)canBeChoose{
    return _canChoose;
}

-(void)setCanChoose:(BOOL)CanChoose{
    _canChoose = CanChoose;

    for (int i=901; i<=905; i++) {
        UIButton *BTN = (UIButton *)[self viewWithTag:i];
        BTN.enabled = CanChoose;
    }
}

-(BOOL)animation{
    return _animation;
}
-(void)setAnimation:(BOOL)animation{
    _animation = animation;
}

-(UIImage *)starImage_Full{
    if(!_starImage_Full){
        _starImage_Full = [UIImage imageNamed:@"YQStarViewFull.png"];
    }
    return _starImage_Full;
}

-(void)setStarImage_Full:(UIImage *)image{
    _starImage_Full = image;
    [self setup];
}

-(UIImage *)starImage_Empty{
    if(!_starImage_Empty){
        _starImage_Empty = [UIImage imageNamed:@"YQStarViewEmpty.png"];
    }
    return _starImage_Empty;
}

-(void)setStarImage_Empty:(UIImage *)image{
    _starImage_Empty = image;
    [self setup];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    [self setup];
    
    return self;
}

/**
 *  初始化
 */
-(void)setup{

    self.backgroundColor = [UIColor clearColor];
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    self.FullMaskView = [[UIView alloc]init];
    
    float maskWidth = 0;
    if(self.Score.floatValue<5){
        maskWidth = self.bounds.size.width*(self.Score.floatValue/5);
    }else{
        maskWidth = self.bounds.size.width;
    }
    
    self.FullMaskView.frame = CGRectMake(0,0,
                                         maskWidth,
                                         self.bounds.size.height);
    self.FullMaskView.layer.masksToBounds = YES;
    
    if(self.bounds.size.width<=self.bounds.size.height*5){
        //根据宽度确定star大小
        self.mid = 0;
        self.starWidth = self.bounds.size.width/5;
        
    }else{
        //根据高度确定star大小
        self.starWidth = self.bounds.size.height;
        self.mid = (self.bounds.size.width-(self.bounds.size.height*5))/4;
    }
    
    
    for (int i=0; i<5; i++) {
        //绘制空星
        UIImageView *IMGV = [[UIImageView alloc]initWithFrame:CGRectMake(i * (self.starWidth+self.mid),
                                                                         0,
                                                                         self.starWidth,
                                                                         self.starWidth)];
        IMGV.contentMode = UIViewContentModeScaleAspectFit;
        IMGV.image = self.starImage_Empty;
        [self addSubview:IMGV];
        //绘制实星
        UIImageView *IMGV_Full = [[UIImageView alloc]initWithFrame:IMGV.frame];
        IMGV_Full.contentMode = UIViewContentModeScaleAspectFill;
        IMGV_Full.image = self.starImage_Full;
        [self.FullMaskView addSubview:IMGV_Full];
        
    }
    
    [self addSubview:self.FullMaskView];
    
    //绘制BTN
    
    for (int i=0 ; i<5; i++) {
        UIButton *BTN = [UIButton buttonWithType:UIButtonTypeCustom];
        BTN.frame = CGRectMake(i * (self.starWidth+self.mid) - (self.mid/2),
                               0,
                               self.starWidth+self.mid,
                               self.starWidth);
//        BTN.backgroundColor = [UIColor redColor];
//        BTN.alpha = 0.3;
        BTN.tag = 901+i;
        [BTN addTarget:self action:@selector(ChoosedStar:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:BTN];
        if(!self.canBeChoose){
            BTN.enabled = NO;
        }
    }
}

/**
 *  选择了星星
 *
 *  @param BTN 按钮
 */
-(void)ChoosedStar:(UIButton *)BTN{
    NSInteger tag = BTN.tag;
    tag -= 900;

    if(self.animation){
        [UIView animateWithDuration:0.3 animations:^{
            self.FullMaskView.frame = CGRectMake(self.FullMaskView.frame.origin.x,
                                                 self.FullMaskView.frame.origin.y,
                                                 self.bounds.size.width*(tag/5.0),
                                                 self.FullMaskView.frame.size.height);
        }];

    }else{
        self.FullMaskView.frame = CGRectMake(self.FullMaskView.frame.origin.x,
                                             self.FullMaskView.frame.origin.y,
                                             self.bounds.size.width*(tag/5.0),
                                             self.FullMaskView.frame.size.height);
    }
    
    _Score = [NSNumber numberWithInteger:tag];
}


@end
