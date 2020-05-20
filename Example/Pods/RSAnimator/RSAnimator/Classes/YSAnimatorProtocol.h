//
//  YSAnimatorProtocol.h
//  YiShouComponent
//
//  Created by lyonLiu on 2020/5/6.
//  Copyright © 2020 yishou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YSAnimatorProtocol <NSObject>

/// 使用动画的视图对象
@property (weak, nonatomic) UIView *objView;


/// 显示动画视图
/// @param view 父视图
- (void)showInView:(UIView *_Nonnull)view;
/// 隐藏视图
- (void)dismiss;

@end

NS_ASSUME_NONNULL_END
