//
//  RSParentViewController.m
//  RSKitExtension_Example
//
//  Created by lyonLiu on 2020/5/19.
//  Copyright © 2020 lyon888. All rights reserved.
//

#import "RSParentViewController.h"

@interface RSParentViewController ()

@end

@implementation RSParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    NSLog(@"name = %@,userinfo = %@",eventName,userInfo);
}

@end
