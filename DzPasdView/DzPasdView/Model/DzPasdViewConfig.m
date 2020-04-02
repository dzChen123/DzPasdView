//
//  DzPasdViewConfig.m
//  DzPasdView
//
//  Created by 陈毅琥 on 2020/4/1.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

#import "DzPasdViewConfig.h"

@implementation DzPasdViewConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        self.revealType = DzPasdRevealTypePasd;
        self.pasdLength = 6;
        self.pasdViewInset = 30;
        self.pasdItemWidth = 45;
        self.pasdItemBorderWidth = 1;
        self.pasdItemPadding = 8;
        self.pasdItemBgColor = [UIColor lightGrayColor];
        self.contentColor = [UIColor blackColor];
        self.contentFontSize = 14;
        self.contentDotWidth = 9;
        self.selectBorderColor = [UIColor blackColor];
        self.normalBorderColor = [UIColor grayColor];
    }
    return self;
}

@end
