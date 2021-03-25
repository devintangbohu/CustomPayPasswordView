//
//  lxy_CustomPayPasswordView.h
//  CustomPayPasswordViewDemo
//
//  Created by Devin on 2021/3/13.
//  Copyright © 2021 tracy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface lxy_CustomPayPasswordView : UIView

/** 支付类型 */
@property (nonatomic, copy) NSString *payTypeStr;
/** 支付金额 */
@property (nonatomic, copy) NSString *payMoneyStr;
/** 输入密码完成 */
@property (nonatomic, copy) void(^completeBlock)( NSString *payPassword);

/** 显示当前的支付密码视图在keywindow上*/
-(void)show;

/** 隐藏当前的支付密码视图*/
-(void)hidden;

@end

NS_ASSUME_NONNULL_END
