//
//  lxy_CustomPayPasswordView.m
//  CustomPayPasswordViewDemo
//
//  Created by Devin on 2021/3/13.
//  Copyright © 2021 tracy. All rights reserved.
//

#import "lxy_CustomPayPasswordView.h"
#import "lxy_PayPasswordKeyboard.h"
#import "lxy_PayPasswordAndAmountView.h"
#import "lxy_Define.h"
#import "UIView+lxyExtension.h"

@interface lxy_CustomPayPasswordView()
/** 背景 */
@property (nonatomic, weak) UIView *coverView;
/** 键盘高度 */
@property (nonatomic, assign) CGFloat keyboardH;
/** 动画时间 */
@property (nonatomic, assign) CGFloat animateDuration;
/** 支付密码键盘 */
@property (nonatomic, weak) lxy_PayPasswordKeyboard *pwdKeyboard;
/** 支付密码视图 */
@property (nonatomic, weak) lxy_PayPasswordAndAmountView *payPwdView;



@end

@implementation lxy_CustomPayPasswordView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _keyboardH = 230;
        _animateDuration = 0.25;
        [self initCustomPayPasswordViewUI];
    }
    return self;
}
-(void)initCustomPayPasswordViewUI{
    lxy_SelfWeak;
    UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, lxy_ScreenWidth, lxy_ScreenHeight)];
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.4;
 
    lxy_PayPasswordAndAmountView *payPwdView = [[lxy_PayPasswordAndAmountView alloc] init];
    self.payPwdView = payPwdView;
    payPwdView.closeBtnBlock = ^{
        [weakSelf hidden];
    };
    lxy_PayPasswordKeyboard *pwdKeyboard = [[lxy_PayPasswordKeyboard alloc] init];
    self.pwdKeyboard = pwdKeyboard;
    pwdKeyboard.numberBtnBlock = ^(NSArray<NSString *> * _Nonnull pwdArr) {
        payPwdView.pwdArr = pwdArr;
    };
    pwdKeyboard.deleteBtnBlock = ^(NSArray * _Nullable deleteArr) {
        payPwdView.deletePwdArr = deleteArr;
    };
    pwdKeyboard.completeBlock = ^(NSArray<NSString *> * _Nonnull completeArr) {
        payPwdView.pwdArr = completeArr;
        if (weakSelf.completeBlock) {
            NSString *pwdStr = [self getPwdStrToPwdArr:completeArr];
            weakSelf.completeBlock(pwdStr);
        };
    };
    
    [self addSubview:coverView];
    [self addSubview:payPwdView];
    [self addSubview:pwdKeyboard];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.height = lxy_ScreenHeight;
    self.width = lxy_ScreenWidth;
    
    CGFloat payPwdW = 300;
    CGFloat payPwdX = (self.width - payPwdW)*0.5;
    CGFloat payPwdH = 220;
    CGFloat keyboardMargin = 60;
    CGFloat keyboardY = self.height - _keyboardH;
    CGFloat payPwdY = keyboardY - payPwdH - keyboardMargin;
    
    _payPwdView.frame = CGRectMake(payPwdX, payPwdY, payPwdW, payPwdH);
    _pwdKeyboard.frame = CGRectMake(0, keyboardY, self.width, _keyboardH);
    
}

-(NSString *)getPwdStrToPwdArr:(NSArray<NSString*> *)pwdArr{
    NSString *allPwdStr = @"";
    for (NSString *pwd in pwdArr) {
        allPwdStr = [NSString stringWithFormat:@"%@%@",allPwdStr,pwd];
    }
    return allPwdStr;
}


#pragma mark ---- set,get方法


-(void)setPayTypeStr:(NSString *)payTypeStr{
    _payTypeStr = payTypeStr;
    _payPwdView.payTypeStr = payTypeStr;
}


-(void)setPayMoneyStr:(NSString *)payMoneyStr{
    _payMoneyStr = payMoneyStr;
    _payPwdView.payMoneyStr = payMoneyStr;
}

#pragma mark ---- 供外面调用的方法

-(void)clearPasswordData{
    [self.pwdKeyboard clearKeyboardData];
    [self.payPwdView resetPasswordBoxColor];
}


-(void)showKeyboard{
    [self keyboardAnimate:^{
        self.pwdKeyboard.y = self.height - self.keyboardH;
    } completion:nil];
    [self passwordViewScaleAnimate];
}

-(void)hideKeyboardCompletion:(void(^)(void))completion{
    [self keyboardAnimate:^{
        self.pwdKeyboard.y = self.height;
    } completion:^{
        if (completion){completion();}
    }];
}

-(void)keyboardAnimate:(void(^)(void))operation completion:(void(^)(void))completion{
    [UIView animateWithDuration:_animateDuration animations:^{
        if (operation){operation();}
    } completion:^(BOOL finished) {
        if (finished) { if (completion){completion();}}
    }];
}

-(void)passwordViewScaleAnimate{
    [self.payPwdView scaleAnimateWithDuration:0.15f scaleValue:1.1];
}

-(void)show{
    
    UIWindow *keyWindow = [UIApplication sharedApplication].windows[0];
    [keyWindow addSubview:self];
    [self showKeyboard];
    
}

-(void)hidden{
    
    [self hideKeyboardCompletion:^{
        [self clearPasswordData];
        [self removeFromSuperview];
    }];
   
}

@end
