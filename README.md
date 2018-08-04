# YQFiveStarView

#### 微博：畸形滴小男孩
##### iOS端 简单的五星评价控件
-直接拖到工程中使用

### Example Code:
##### 仅显示：
```objective-c
YQFiveStarView *view = [[YQFiveStarView alloc]initWithFrame:CGRectMake(50, 200,350,50)];
view.Score = @3.5;
[self.view addSubview:view];
```
 ![image](https://github.com/976431yang/YQFiveStarView/blob/master/YQFiveStarViewDemo/image/normal.png)
##### 更换图标：
```objective-c
view.starImage_Full = [UIImage imageNamed:@"img1.png"];
view.starImage_Empty = [UIImage imageNamed:@"img2.png"];
```
![image](https://github.com/976431yang/YQFiveStarView/blob/master/YQFiveStarViewDemo/image/changeimage.png)
#### 可以点击的模式：
```objective-c
view.canChoose = YES;
```
#### 星星变化时加上动画：
```objective-c
view.animation = YES;
```
![image](https://github.com/976431yang/YQFiveStarView/blob/master/YQFiveStarViewDemo/image/animation.gif)
