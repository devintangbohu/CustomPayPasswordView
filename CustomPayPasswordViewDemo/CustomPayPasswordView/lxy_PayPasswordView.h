//
//  lxy_PayPasswordView.h
//  CustomPayPasswordViewDemo
//
//  Created by Devin on 2021/3/12.
//  Copyright © 2021 tracy. All rights reserved.
//  6位支付密码视图

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface lxy_PayPasswordView : UIView
/** 密码数据 */
@property (nonatomic, strong) NSArray *pwdArr;
/** 删除按钮点击之后 密码数据 */
@property (nonatomic, strong) NSArray *deletePwdArr;

//初始化几个支付密码框(默认6个)
- (instancetype)initWithFrame:(CGRect)frame pwdCount:(NSUInteger)pwdCount;

-(void)resetPasswordBoxColor;

@end

NS_ASSUME_NONNULL_END
