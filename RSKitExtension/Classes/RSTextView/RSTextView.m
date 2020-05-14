//
//  RSTextView.m
//  YiShouComponent
//
//  Created by lyonLiu on 2020/5/9.
//  Copyright © 2020 yishou. All rights reserved.
//

#import "RSTextView.h"

@implementation RSTextView

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initData];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initData];
    }
    return self;
}

- (void)initData
{
    // 设置默认字体
    self.font = [UIFont systemFontOfSize:15];
    // 设置默认颜色
    self.placeholderColor = [UIColor grayColor];
    // 使用通知监听文字改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:self];
}

/// 每次调用drawRect:方法，都会将以前画的东西清除掉
- (void)drawRect:(CGRect)rect
{
    // 如果有文字，就直接返回，不需要画占位文字
    if (self.hasText) return;

    // 属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = self.font;
    attrs[NSForegroundColorAttributeName] = self.placeholderColor;
    attrs[NSBackgroundColorAttributeName] = [UIColor cyanColor];

    // 画文字
    if (self.textAlignment == NSTextAlignmentRight) {
        CGSize size = [self.placeholder boundingRectWithSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
        rect.origin.x = rect.size.width - size.width;
        rect.origin.y = 8;
        rect.size.width -= rect.origin.x;
    } else {
        //绘制的文字x边距跟实际的文本有5pt的偏差
        CGFloat diff = 5.f;
        UIEdgeInsets inset = self.textContainerInset;
        rect.origin.x = inset.left + diff;
        rect.origin.y = inset.top;
        rect.size.width -= (2 * diff + inset.left + inset.right);
    }
    [self.placeholder drawInRect:rect withAttributes:attrs];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setNeedsDisplay];
}

#pragma mark - event

- (void)textDidChange:(NSNotification *)note
{
    // 会重新调用drawRect:方法
    [self setNeedsDisplay];
}

#pragma mark - setter

/// 设置contentinset会错位，将contentinset指向textContainerInset
- (void)setContentInset:(UIEdgeInsets)contentInset
{
    self.textContainerInset = contentInset;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    [self setNeedsDisplay];
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    [self setNeedsDisplay];
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    
    [self setNeedsDisplay];
}

@end
