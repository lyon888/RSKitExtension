//
//  RSViewController.m
//  RSKitExtension
//
//  Created by lyon888 on 05/09/2020.
//  Copyright (c) 2020 lyon888. All rights reserved.
//

#import "RSViewController.h"
#import "RSTextViewController.h"

@interface RSViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSArray *datas;

@end

@implementation RSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.datas = @[@"RSTextView",@"RSResponderChain"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ctrName = [NSString stringWithFormat:@"%@Controller",self.datas[indexPath.row]];
    Class cls = NSClassFromString(ctrName);
    id ctr = [[cls alloc] init];
    if ([ctr isKindOfClass:[UIViewController class]]) {
        [self.navigationController pushViewController:ctr animated:YES];
    }
}

@end
