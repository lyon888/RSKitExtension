//
//  RSResponderChainTableCell.m
//  RSKitExtension_Example
//
//  Created by lyonLiu on 2020/5/19.
//  Copyright © 2020 lyon888. All rights reserved.
//

#import "RSResponderChainTableCell.h"
#import "UIResponder+RSRouter.h"

NSString * const ATableViewCellAEvent = @"ATableViewCell_AEvent";
NSString * const ATableViewCellBEvent = @"ATableViewCell_BEvent";

@interface RSResponderChainTableCell ()
@property (weak, nonatomic) IBOutlet UIButton *AButton;
@property (weak, nonatomic) IBOutlet UIButton *BButton;

@end

@implementation RSResponderChainTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)AClickAction:(id)sender
{
    [self routerEventWithName:ATableViewCellAEvent userInfo:@{@"aTitle" : (self.AButton.titleLabel.text ? self.AButton.titleLabel.text : @"")}];
}

- (IBAction)BClickAction:(id)sender
{
    [self routerEventWithName:ATableViewCellBEvent userInfo:@{@"bTitle" : (self.BButton.titleLabel.text ? self.BButton.titleLabel.text : @"")}];
}


//- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
//{
//    NSInvocation *invocation = self.eventStrategy[eventName];
//    [invocation setArgument:&userInfo atIndex:2];
//    [invocation invoke];
//
//    // 如果需要让事件继续往上传递，则调用下面的语句
//    // [super routerEventWithName:eventName userInfo:userInfo];
//}
//
//- (void)aEvent:(NSDictionary *)userInfo
//{
//    NSLog(@"不需要让事件继续往上传递 \n eventName:%@ \n userInfo:%@", ATableViewCellAEvent, userInfo);
//}
//
//- (void)bEvent:(NSDictionary *)userInfo
//{
//    NSMutableDictionary *mUserInfo = [NSMutableDictionary dictionaryWithDictionary:userInfo];
//    [mUserInfo setValue:NSStringFromClass(self.class) forKey:@"eventClass"];
//
//    // 如果需要让事件继续往上传递，则调用下面的语句
//    [super routerEventWithName:ATableViewCellBEvent userInfo:mUserInfo];
//}


@end
