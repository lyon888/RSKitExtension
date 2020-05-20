//
//  UIView+RSCreate.m
//  RSKitExtension_Example
//
//  Created by lyonLiu on 2020/5/19.
//  Copyright © 2020 lyon888. All rights reserved.
//

#import "UIView+RSCreate.h"

@implementation UIView (RSCreate)

+ (id)loadFromNib
{
    NSString *xibName = NSStringFromClass([self class]);
    return [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] firstObject];
}

+ (UINib *)registerNib
{
    NSString *xibName = NSStringFromClass([self class]);
    return [UINib nibWithNibName:xibName bundle:nil];
}

+ (NSString *)className
{
    return NSStringFromClass(self.class);
}
@end
