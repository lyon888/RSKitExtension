//
//  FMScrollConfilctTool.h
//  YiShou
//
//  Created by lyonLiu on 2020/5/28.
//  Copyright © 2020 FuMi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSScrollTool : NSObject

/// 处理多滚动视图时手势冲突问题
/// @param childScroll 子滚动视图
/// @param superScroll 父滚动视图
- (void)toResolveSingleConflict:(UIScrollView *)childScroll onSuperScrollView:(UIScrollView *)superScroll;

/// 处理多滚动视图时手势冲突问题
/// @param childScrolls 子滚动视图数组
/// @param superScroll 父滚动视图
- (void)toResolveMutilConflict:(NSArray <UIScrollView *> *)childScrolls onSuperScrollView:(UIScrollView *)superScroll;

@end

NS_ASSUME_NONNULL_END
