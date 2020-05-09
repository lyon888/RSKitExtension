//
//  RSTextView.h
//  YiShouComponent
//
//  Created by lyonLiu on 2020/5/9.
//  Copyright © 2020 yishou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSTextView : UITextView

/// 占位符文本
@property (nonatomic, copy) NSString *placeholder;

/// 占位符文本颜色 */
@property (nonatomic, copy) UIColor *placeholderColor;

@end

NS_ASSUME_NONNULL_END
