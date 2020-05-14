//
//  RSCountdownTool.h
//  RSKitExtension_Example
//
//  Created by lyonLiu on 2020/5/14.
//  Copyright © 2020 lyon888. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol RSCountdownTaskProtocol <NSObject>
- (void)countdownRefreshHandle;

@end

@interface RSCountdownTool : NSObject
+ (instancetype)countdownName:(NSString *)name refreshRate:(CGFloat)rate;

- (void)addTask:(id<RSCountdownTaskProtocol>)task;
- (void)removeTask:(id<RSCountdownTaskProtocol>)task;

@end

NS_ASSUME_NONNULL_END
