//
//  lxy_PayPasswordItem.h
//  CustomPayPasswordViewDemo
//
//  Created by Devin on 2021/3/12.
//  Copyright © 2021 tracy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface lxy_PayPasswordItem : UIView

/** 是否显示密码 */
@property (nonatomic, assign) BOOL isHidePassword;

/** 中间圆的颜色 */
@property (nonatomic, strong) UIColor *circleColor;
/** 中间圆的尺寸 */
@property (nonatomic, assign) CGSize circleSize;


@end

NS_ASSUME_NONNULL_END
