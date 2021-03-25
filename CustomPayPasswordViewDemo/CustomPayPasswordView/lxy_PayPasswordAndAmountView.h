//
//  lxy_PayPasswordAndAmountView.h
//  CustomPayPasswordViewDemo
//
//  Created by Devin on 2021/3/12.
//  Copyright © 2021 tracy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface lxy_PayPasswordAndAmountView : UIView

/** 支付类型 */
@property (nonatomic, copy) NSString *payTypeStr;
/** 支付金额 */
@property (nonatomic, copy) NSString *payMoneyStr;

/** 密码数据 */
@property (nonatomic, strong) NSArray *pwdArr;
/** 删除按钮点击之后 密码数据 */
@property (nonatomic, strong) NSArray *deletePwdArr;
/** 关闭按钮 */
@property (nonatomic, copy) void(^closeBtnBlock)(void);

/** 重置密码框颜色 */
-(void)resetPasswordBoxColor;


@end

NS_ASSUME_NONNULL_END
