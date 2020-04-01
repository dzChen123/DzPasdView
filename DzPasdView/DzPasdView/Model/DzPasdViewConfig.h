//
//  DzPasdViewConfig.h
//  DzPasdView
//
//  Created by 陈毅琥 on 2020/4/1.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum{
    DzPasdRevealTypeMingWen,    //明文显示
    DzPasdRevealTypePasd,   //密码隐藏显示 "..."
    DzPasdRevealTypeChangeable  //可变化的
} DzPasdRevealType;

@interface DzPasdViewConfig : NSObject

@property (assign, nonatomic) DzPasdRevealType revealType;
@property (assign, nonatomic) NSInteger pasdLength; //密码长度
@property (assign, nonatomic) CGFloat pasdViewInset; //最左最右小格子到边缘的距离

@property (assign, nonatomic) CGFloat pasdItemWidth; //小格子宽度
@property (assign, nonatomic) CGFloat pasdItemBorderWidth; //小格子border宽度
@property (assign, nonatomic) CGFloat pasdItemPadding; //小格子之间的间距
@property (strong, nonatomic) UIColor *pasdItemBgColor;  //每个小格子的背景色
@property (strong, nonatomic) UIColor *pasdItemBorderColor;  //每个小格子的border色
@property (strong, nonatomic) UIColor *contentColor;    //小格子内容的颜色
@property (assign, nonatomic) CGFloat contentFontSize;  //如果是明文显示的话必填
@property (assign, nonatomic) CGFloat contentDotWidth;  //如果是隐藏显示的话必填
@property (strong, nonatomic) UIColor *selectBorderColor, *normalBorderColor;   //小格子被选中和未选中的边框颜色

@end

NS_ASSUME_NONNULL_END
