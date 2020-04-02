//
//  DzPasdView.h
//  DzPasdView
//
//  Created by 陈毅琥 on 2020/3/31.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DzPasdViewDelegate <NSObject>

@optional
- (void)pasdFieldTextDidChanged:(NSString *)pasdText;   //在编辑过程中触发
- (void)pasdFieldTextDidComplete:(NSString *)pasdText;  //在密码框输入达到指定密码位数之后触发
- (void)pasdFieldWrongTextDidEntered;

@end

//小格子整体对于DzPasdView是居中显示的 未提供修改接口。可自行修改
@interface DzPasdView : UIView

@property (strong, nonatomic) NSString *pasd;
@property (weak, nonatomic) id<DzPasdViewDelegate> delegate;

- (instancetype)initWithConfig:(id)config;
- (void)removePasdContent;      //清空密码框内容
- (void)wrongPasdContent;   //密码校验错误的时候 显示

@end

NS_ASSUME_NONNULL_END
