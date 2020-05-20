//
//  UIView+Animator.h
//  YiShouComponent
//
//  Created by lyonLiu on 2020/5/6.
//  Copyright © 2020 yishou. All rights reserved.
//
//  ⚠️仅用于YSAnimator

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YSAnimator)

/// 使用动画的主体视图
/// .m文件中使用@dynamic contentView 阻止自动生成getter/setter
@property (nonatomic, strong) UIView *contentView;
 


@end

NS_ASSUME_NONNULL_END
