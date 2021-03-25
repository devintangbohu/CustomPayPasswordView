//
//  lxy_PayPasswordKeyboard.h
//  CustomPayPasswordViewDemo
//
//  Created by Devin on 2021/3/12.
//  Copyright © 2021 tracy. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface lxy_PayPasswordKeyboard : UIView
/** 数字按钮点击 */
@property (nonatomic, copy) void(^numberBtnBlock)(NSArray<NSString *>*pwdArr);
/** 删除按钮点击 */
@property (nonatomic, copy) void(^deleteBtnBlock)( NSArray *_Nullable deleteArr);

/** 密码输入完成block */
@property (nonatomic, copy) void(^completeBlock)( NSArray<NSString *>* completeArr);



//清除键盘数据
-(void)clearKeyboardData;

@end

NS_ASSUME_NONNULL_END
