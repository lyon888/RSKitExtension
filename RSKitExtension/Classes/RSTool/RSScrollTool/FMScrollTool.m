//
//  FMScrollConfilctTool.m
//  YiShou
//
//  Created by lyonLiu on 2020/5/28.
//  Copyright © 2020 FuMi. All rights reserved.
//

#import "FMScrollTool.h"

typedef NS_ENUM(NSInteger,FMScrollDirection) {
    FMScrollDirectionPossible   = 0,    // 默认
    FMScrollDirectionVertical,          // 垂直
    FMScrollDirectionHorizontal         // 水平
};

@interface RSScrollTool ()

/// 开始的起点
@property (assign, nonatomic) CGPoint startP;
/// 父滚动视图
@property (nonatomic,strong) UIScrollView *superScroll;
/// 滚动方向
@property (nonatomic,assign) FMScrollDirection direction;

@end

@implementation RSScrollTool

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

- (void)toResolveSingleConflict:(UIScrollView *)childScroll onSuperScrollView:(UIScrollView *)superScroll
{
    [self toResolveMutilConflict:@[childScroll] onSuperScrollView:superScroll];
}

- (void)toResolveMutilConflict:(NSArray<UIScrollView *> *)childScrolls onSuperScrollView:(UIScrollView *)superScroll
{
    _superScroll = superScroll;
//    NSInteger i = 1000;
    for (UIScrollView *childScroll in childScrolls) {
//        childScroll.tag = i++;
        UIPanGestureRecognizer *pan = childScroll.panGestureRecognizer;
        [pan addTarget:self action:@selector(panGesAction:)];
    }
}

/**

##################### 滑动角度计算 #####################

 一、分为四种情况
 vP.x < 0为左划
 vP.x > 0为右划
 vP.y < 0为上划
 vP.y > 0为下滑
 
 1.第一象限(左上) vP.x < 0 && vP.y < 0
 2.第二象限(右上) vP.x > 0 && vP.y < 0
 3.第三象限(左下) vP.x < 0 && vP.y > 0
 4.第四象限(右下) vP.x > 0 && vP.y > 0
 
 二、分为两种情况
 1.左右滑动 | endP.x | >= | endP.y |
 2.上下滑动| endP.x | < | endP.y |
 **/

/**
##################### 手势状态 #####################
//    UIGestureRecognizerStatePossible, 0
//    UIGestureRecognizerStateBegan,1
//    UIGestureRecognizerStateChanged,2
//    UIGestureRecognizerStateEnded,3
//    UIGestureRecognizerStateCancelled,4
//    UIGestureRecognizerStateFailed,5
//    UIGestureRecognizerStateRecognized = UIGestureRecognizerStateEnded 6
*/

#pragma mark - event

- (void)panGesAction:(UIPanGestureRecognizer *)pan
{
    // 手势作用的视图
    UIScrollView *childScroll = (UIScrollView *)pan.view;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGPoint point = [pan translationInView:window];// 当前手指移动坐标
    CGPoint vP = [pan velocityInView:window];// 当前手指偏移坐标
    
    if (pan.state == UIGestureRecognizerStateBegan)
    {
        self.startP = point;
        self.direction = FMScrollDirectionPossible;
    }
    else if (pan.state == UIGestureRecognizerStateChanged)
    {
        CGPoint endP = CGPointMake( self.startP.x + vP.x, self.startP.y + vP.y );
        if (fabs(endP.x) >= fabs(endP.y)) {//左右滑动
            if (self.direction == FMScrollDirectionPossible) {
                _superScroll.scrollEnabled = NO;
                childScroll.scrollEnabled = YES;
                self.direction = FMScrollDirectionHorizontal;
            }
        } else {//上下滑动
            if (self.direction == FMScrollDirectionPossible) {
                _superScroll.scrollEnabled = YES;
                childScroll.scrollEnabled = NO;
                self.direction = FMScrollDirectionVertical;
            }
        }
        self.startP = endP;
    }
    else if (pan.state == UIGestureRecognizerStateEnded ||
             pan.state == UIGestureRecognizerStateCancelled)
    {
        _superScroll.scrollEnabled = YES;
        childScroll.scrollEnabled = YES;
    }
}

@end
