//
//  UIView+RSCreate.h
//  RSKitExtension_Example
//
//  Created by lyonLiu on 2020/5/19.
//  Copyright © 2020 lyon888. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (RSCreate)
/*!
 *  @brief load from nib
 *
 *  @return
 */
+ (id)loadFromNib;

/*!
 *  @brief register nib
 *
 *  @return
 */
+ (UINib *)registerNib;
/**
 获取类名

 @return
 */
+ (NSString *)className;
@end

NS_ASSUME_NONNULL_END
