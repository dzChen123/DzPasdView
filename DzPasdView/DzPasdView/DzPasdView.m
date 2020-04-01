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

@interface DzPasdView ()

@property (strong, nonatomic) UITextField *pasdField;
@property (strong, nonatomic) NSMutableArray *itemViews;    //每个小格子

@end

@implementation DzPasdView

- (instancetype)initWithConfig:(id)config {
    if (![config isKindOfClass:[DzPasdViewConfig class]]) {
        NSLog(@"DzPasdView init failed. Reason : invaild config class");
        return nil;
    }
    self = [super init];
    [self createUIWithConfig:config];
    
    return self;
}

- (void)createUIWithConfig:(DzPasdViewConfig *)config {
    self.itemViews = [NSMutableArray new];
    
    //create textfield
    self.pasdField = [UITextField new];
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

@end
