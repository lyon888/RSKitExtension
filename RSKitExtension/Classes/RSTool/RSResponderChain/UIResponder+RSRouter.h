//
//  UIResponder+RSRouter.h
//  RSKitExtension_Example
//
//  Created by lyonLiu on 2020/5/19.
//  Copyright © 2020 lyon888. All rights reserved.
//
//  通过系统的响应链实现跨层UI交互
//  参考：https://casatwy.com/responder_chain_communication.html

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (RSRouter)


- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

/// 通过方法子创建Invocation
- (NSInvocation *)createInvocationBySelector:(SEL)selector;

@end

NS_ASSUME_NONNULL_END
