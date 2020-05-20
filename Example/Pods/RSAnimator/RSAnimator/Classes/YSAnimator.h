//
//  YSAnimator.h
//  YiShouComponent
//
//  Created by lyonLiu on 2020/5/6.
//  Copyright © 2020 yishou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSAnimatorProtocol.h"

NS_ASSUME_NONNULL_BEGIN

// 动画弹出类型
typedef NS_ENUM(NSInteger , YSAnimatorPopType) {
    YSAnimatorPopTypeScale = 0,   //从小到大弹出
    YSAnimatorPopTypeUpToBottom,        //从上到下弹出
    YSAnimatorPopTypeBottomToUp         //从下到上弹出
};

@interface YSAnimator : NSObject<YSAnimatorProtocol>

/// 协议声明的变量，编译器不会自动生成实例变量
/// 需在Animator中重新声明 或  在.m文件中 @synthesize objView
// @property (nonatomic,weak) UIView *objView;


/// 可增动画参数

/// 动画类型 默认0
@property (nonatomic, assign) YSAnimatorPopType type;

@end

NS_ASSUME_NONNULL_END
