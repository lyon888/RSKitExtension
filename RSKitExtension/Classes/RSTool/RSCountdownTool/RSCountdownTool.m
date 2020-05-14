//
//  RSCountdownTool.m
//  RSKitExtension_Example
//
//  Created by lyonLiu on 2020/5/14.
//  Copyright © 2020 lyon888. All rights reserved.
//

#import "RSCountdownTool.h"

@interface RSCountdownTool ()
@property (strong, nonatomic) dispatch_source_t timer;
@property (strong, nonatomic) NSPointerArray *tasks;
@property (assign, nonatomic) CGFloat rate;
@end

@implementation RSCountdownTool

#pragma mark - life cycle

- (instancetype)init
{
    if (self = [super init]) {
        self.rate = 1;
    }
    return self;
}

#pragma mark - private
+ (NSMutableDictionary *)countdownMap{
    static NSMutableDictionary *map = nil;
    if (!map) {
        map = [NSMutableDictionary new];
    }
    return map;
}
+ (instancetype)countdownName:(NSString *)name refreshRate:(CGFloat)rate{
    RSCountdownTool *instance = [self countdownMap][name];
    if (!instance) {
        instance = [RSCountdownTool new];
        instance.rate = rate;
        [self countdownMap][name] = instance;
    }
    return instance;
}
- (void)setupTimer{
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, self.rate * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.timer, ^{
        if ([self tasks].count == 0) {
            dispatch_source_cancel(self.timer);
            self.timer = nil;
            return;
        }
        for (int i = 0; i < self.tasks.count; i++) {
            id task = [self.tasks pointerAtIndex:i];
            if (task) {
                [task countdownRefreshHandle];
            }
        }
    });
    dispatch_resume(self.timer);
}
#pragma mark - public
- (void)addTask:(id<RSCountdownTaskProtocol>)task{
    if (![task respondsToSelector:@selector(countdownRefreshHandle)]) {
        return;
    }
    
    [self.tasks addPointer:(__bridge void * _Nullable)(task)];
    if (!self.timer) {
        [self setupTimer];
    }
}
- (void)removeTask:(id<RSCountdownTaskProtocol>)task{
    [self.tasks compact];
    for (int i = 0; i<self.tasks.count; i++) {
        if ([self.tasks pointerAtIndex:i] == (__bridge void * _Nullable)(task)) {
            [self.tasks removePointerAtIndex:i];
        }
    }
}
#pragma mark - delegate

#pragma mark - setter

#pragma mark - getter

- (NSPointerArray *)tasks{
    if (!_tasks) {
        _tasks = [NSPointerArray weakObjectsPointerArray];
    }
    return _tasks;
}
@end
