//
//  DzPasdView.m
//  DzPasdView
//
//  Created by 陈毅琥 on 2020/3/31.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

#import "DzPasdView.h"

#import "DzPasdItemView.h"

#import <Masonry.h>
#import "DzPasdViewConfig.h"

@interface DzPasdView ()<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *pasdField;
@property (strong, nonatomic) NSMutableArray *itemViews;    //每个小格子

@property (assign, nonatomic) NSInteger pasdLength;

@end

@implementation DzPasdView

- (instancetype)initWithConfig:(id)config {
    if (![config isKindOfClass:[DzPasdViewConfig class]]) {
        NSLog(@"DzPasdView init failed. Reason : invaild config class");
        return nil;
    }
    self = [super init];
    [self createUIWithConfig:config];
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(becomeFirstResponder)]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resignFirstResponder) name:UIKeyboardWillHideNotification object:nil];
    
    return self;
}

- (void)createUIWithConfig:(DzPasdViewConfig *)config {
    self.itemViews = [NSMutableArray new];
    self.pasdLength = config.pasdLength;
    
    //create textfield
    self.pasdField = [UITextField new];
    self.pasdField.delegate = self;
    self.pasdField.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:self.pasdField];
    
    //loading itemViews
    UIView *lastView;
    for (int count = 0; count < config.pasdLength; count ++) {
        DzPasdItemView *itemView = [[DzPasdItemView alloc] initWithConfig:config];
        [self addSubview:itemView];
        [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (!count) {
                make.left.mas_equalTo(self).offset(config.pasdViewInset);
            } else {
                make.left.mas_equalTo(lastView.mas_right).offset(config.pasdItemPadding);
            }
            make.centerY.mas_equalTo(self);
            make.width.height.mas_equalTo(config.pasdItemWidth);
        }];
        
        lastView = itemView;
        [self.itemViews addObject:itemView];
    }
}


#pragma mark -  UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *replacedText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (replacedText.length > self.pasdLength) {
        return NO;  //暂时没有考虑像中文那种带阴影的那种情况
    }
    
    for (DzPasdItemView *item in self.itemViews) {
        item.isSelected = NO;
        
        NSInteger index = [self.itemViews indexOfObject:item];
        if (index < replacedText.length) {
            item.pasdChar = [replacedText substringWithRange:NSMakeRange(index, 1)];
        } else {
            item.pasdChar = @"";
        }
    }
    NSInteger selectIndex = replacedText.length >= self.pasdLength ? (self.pasdLength - 1) : replacedText.length;
    ((DzPasdItemView *)self.itemViews[selectIndex]).isSelected = YES;
    
    return YES;
}


#pragma mark -  Other method
- (BOOL)becomeFirstResponder {
    [self.pasdField becomeFirstResponder];
    
    NSString *pasd = self.pasdField.text;
    NSInteger selectIndex = pasd.length >= self.pasdLength ? (self.pasdLength - 1) : pasd.length;
    ((DzPasdItemView *)self.itemViews[selectIndex]).isSelected = YES;
    
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder {
    for (DzPasdItemView *item in self.itemViews) {
        item.isSelected = NO;
    }
    return [super resignFirstResponder];
}

@end
