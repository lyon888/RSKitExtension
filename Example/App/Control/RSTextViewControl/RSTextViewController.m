//
//  RSTextViewController.m
//  RSKit_Example
//
//  Created by lyonLiu on 2020/5/9.
//  Copyright © 2020 lyon888. All rights reserved.
//

#import "RSTextViewController.h"
#import <RSTextView.h>

@interface RSTextViewController ()
@property (weak, nonatomic) IBOutlet RSTextView *textView;

@end

@implementation RSTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView.placeholder = @"我是一条有灵魂的占位符";
    self.textView.textContainerInset = UIEdgeInsetsMake(10, 50, 10, 20);
}


@end
