//
//  RSResponderChainViewController.m
//  RSKitExtension_Example
//
//  Created by lyonLiu on 2020/5/19.
//  Copyright © 2020 lyon888. All rights reserved.
//

#import "RSResponderChainController.h"
#import "RSResponderChainTableCell.h"

@interface RSResponderChainController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/// 事件策略
@property (nonatomic, copy) NSDictionary *eventStrategy;

@end

@implementation RSResponderChainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerNib:RSResponderChainTableCell.registerNib forCellReuseIdentifier:RSResponderChainTableCell.className];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RSResponderChainTableCell *cell = [tableView dequeueReusableCellWithIdentifier:RSResponderChainTableCell.className];
    return cell;
}


- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    NSLog(@"name = %@,userinfo = %@",eventName,userInfo);
    NSInvocation *invocation = self.eventStrategy[eventName];
    [invocation setArgument:&userInfo atIndex:2];
    [invocation invoke];
    // 如果需要让事件继续往上传递，则调用下面的语句
//    [self.nextResponder routerEventWithName:eventName userInfo:userInfo];
}

- (void)aEvent:(NSDictionary *)userInfo{
    NSLog(@"aEvent = %@",userInfo);
}

- (void)bEvent:(NSDictionary *)userInfo{
    NSLog(@"bEvent = %@",userInfo);
}

#pragma mark - getter

- (NSDictionary<NSString *, NSInvocation *> *)eventStrategy
{
    if (!_eventStrategy) {
        _eventStrategy = @{
                           ATableViewCellAEvent: [self createInvocationBySelector:@selector(aEvent:)],
                           ATableViewCellBEvent: [self createInvocationBySelector:@selector(bEvent:)]
                           };
    }
    return _eventStrategy;
}

@end
