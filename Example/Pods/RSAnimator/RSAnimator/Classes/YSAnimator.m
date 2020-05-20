//
//  YSAnimator.m
//  YiShouComponent
//
//  Created by lyonLiu on 2020/5/6.
//  Copyright © 2020 yishou. All rights reserved.
//

#import "YSAnimator.h"
#import "UIView+YSAnimator.h"

@interface YSAnimator ()

@end

@implementation YSAnimator
/// 协议声明的变量，编译器不会自动生成实例变量
/// @synthesize objView 生成实例变量
@synthesize objView;


- (void)dealloc{
    NSLog(@"%s",__func__);
}

#pragma mark - public

- (void)showInView:(UIView *)view
{
    if (!self.objView) {
        NSCAssert(self.objView, @"请指定动画作用的主体视图");
        return;
    }
    
    self.objView.alpha = 0;
    self.objView.frame = view.bounds;
    [view addSubview:self.objView];
    
    if (self.type == YSAnimatorPopTypeScale){
        self.objView.contentView.transform = CGAffineTransformMakeScale(0.00001, 0.00001);
    }else if (self.type == YSAnimatorPopTypeUpToBottom){
        self.objView.contentView.transform = CGAffineTransformMakeTranslation(0, -self.objView.contentView.frame.size.height);
    }else if (self.type == YSAnimatorPopTypeBottomToUp){
        self.objView.contentView.transform = CGAffineTransformMakeTranslation(0, self.objView.contentView.frame.size.height);
    }
    [UIView animateWithDuration:.25 animations:^{
        self.objView.alpha = 1;
        self.objView.contentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
}


- (void)dismiss
{
    [UIView animateWithDuration:.25 animations:^{
        self.objView.alpha = 0;
        if (self.type == YSAnimatorPopTypeScale){
            self.objView.contentView.transform = CGAffineTransformMakeScale(0.00001, 0.00001);
        }else if (self.type == YSAnimatorPopTypeUpToBottom){
            self.objView.contentView.transform = CGAffineTransformMakeTranslation(0, -self.objView.contentView.frame.size.height);
        }else if (self.type == YSAnimatorPopTypeBottomToUp){
            self.objView.contentView.transform = CGAffineTransformMakeTranslation(0, self.objView.contentView.frame.size.height);
        }
    } completion:^(BOOL finished) {
        [self.objView removeFromSuperview];
    }];
}




@end
