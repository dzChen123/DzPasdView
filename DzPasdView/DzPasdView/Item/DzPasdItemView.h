//
//  DzPasdItemView.h
//  DzPasdView
//
//  Created by 陈毅琥 on 2020/3/31.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DzPasdItemView : UIView

- (instancetype)initWithConfig:(id)config;

@property (assign, nonatomic) BOOL isSelected;
@property (assign, nonatomic) BOOL isMingWen;   //有 密码 ｜ 明文 两种形式的才需要设置 一般不用动
@property (strong, nonatomic) NSString *pasdChar;

@end


NS_ASSUME_NONNULL_END
