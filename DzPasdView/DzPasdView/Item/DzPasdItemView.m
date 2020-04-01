//
//  DzPasdItemView.m
//  DzPasdView
//
//  Created by 陈毅琥 on 2020/3/31.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

#import "DzPasdItemView.h"

#import <Masonry.h>
#import "DzPasdViewConfig.h"

@interface DzPasdItemView ()

@property (strong, nonatomic) UIView *dotView;      //密码显示点
@property (strong, nonatomic) UILabel *contentLab;      //明文显示内容

@property (assign, nonatomic) DzPasdRevealType revealType;
@property (strong, nonatomic) UIColor *selectBorderColor, *normalColor;

@end

@implementation DzPasdItemView

- (instancetype)initWithConfig:(id)config {
    if (![config isKindOfClass:[DzPasdViewConfig class]]) {
        NSLog(@"DzPasdItemView init failed. Reason : invaild config class");
        return nil;
    }
    self = [super init];
    [self createUIWithConfig:config];
    
    return self;
}

- (void)createUIWithConfig:(DzPasdViewConfig *)config {
    self.isMingWen = NO;
    self.backgroundColor = config.pasdItemBgColor;
    self.layer.borderWidth = config.pasdItemBorderWidth;
    self.layer.borderColor = config.normalBorderColor.CGColor;
    
    if (config.revealType == DzPasdRevealTypePasd) {
        [self createPasdUIWithConfig:config];
    } else if (config.revealType == DzPasdRevealTypeMingWen) {
        [self createMingWenUIWithConfig:config];
    } else {
        [self createPasdUIWithConfig:config];
        [self createMingWenUIWithConfig:config];
    }
}

- (void)createMingWenUIWithConfig:(DzPasdViewConfig *)config {
    self.contentLab = [UILabel new];
    [self addSubview:self.contentLab];
    
    self.contentLab.hidden = YES;
    self.contentLab.textColor = config.contentColor;
    self.contentLab.font = [UIFont systemFontOfSize:config.contentFontSize];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
}

- (void)createPasdUIWithConfig:(DzPasdViewConfig *)config {
    self.dotView = [UIView new];
    [self addSubview:self.dotView];
    
    self.dotView.hidden = YES;
    self.dotView.backgroundColor = config.contentColor;
    self.dotView.layer.cornerRadius = config.contentDotWidth / 2.0;
    [self.dotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.width.height.mas_equalTo(config.contentDotWidth);
    }];
}

#pragma mark -  Setter && Getter
- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    self.layer.borderColor = isSelected ? self.selectBorderColor.CGColor : self.normalColor.CGColor;
}

- (void)setPasdChar:(NSString *)pasdChar {
    _pasdChar = pasdChar;
    
    BOOL isEmpty = [pasdChar isEqualToString:@""];
    self.contentLab.hidden = isEmpty;
    self.dotView.hidden = isEmpty;
    if (!isEmpty) {
        if (self.revealType == DzPasdRevealTypeMingWen || (self.revealType == DzPasdRevealTypeChangeable && self.isMingWen)) {
            self.contentLab.text = pasdChar;
        }
    }
}

- (void)setIsMingWen:(BOOL)isMingWen {
    self.contentLab.hidden = !isMingWen;
    self.dotView.hidden = isMingWen;
}

@end
