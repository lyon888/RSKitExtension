//
//  UIResponder+RSRouter.m
//  RSKitExtension_Example
//
//  Created by lyonLiu on 2020/5/19.
//  Copyright © 2020 lyon888. All rights reserved.
//

#import "UIResponder+RSRouter.h"

@implementation UIResponder (RSRouter)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
}

- (NSInvocation *)createInvocationBySelector:(SEL)selector
{
    NSMethodSignature *signature = [self methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    return invocation;
}

@end
