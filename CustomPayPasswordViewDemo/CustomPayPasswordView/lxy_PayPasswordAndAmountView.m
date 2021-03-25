//
//  lxy_PayPasswordAndAmountView.m
//  CustomPayPasswordViewDemo
//
//  Created by Devin on 2021/3/12.
//  Copyright © 2021 tracy. All rights reserved.
//

#import "lxy_PayPasswordAndAmountView.h"
#import "lxy_Define.h"
#import "UIView+lxyExtension.h"
#import "lxy_PayPasswordView.h"

@interface lxy_PayPasswordAndAmountView()
/** 标题 */
@property (nonatomic, weak) UILabel *titleLab;
/** 关闭按钮 */
@property (nonatomic, weak) UIButton *closeBtn;
/** 支付方式 */
@property (nonatomic, weak) UILabel *payTypeLab;
/** 支付金额 */
@property (nonatomic, weak) UILabel *payMoneyLab;
/** 支付密码 */
@property (nonatomic, weak) lxy_PayPasswordView *pwdView;

@end

@implementation lxy_PayPasswordAndAmountView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initPayPasswordUI];
    }
    return self;
}
-(void)initPayPasswordUI{
    
    UIImage *closeImage = [UIImage imageNamed:@"CustomPayPasswordViewDemo.bundle/Close_btn.png"];
    
    UIButton *closeBtn = [[UIButton alloc] init];
    [closeBtn setImage:closeImage forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.closeBtn = closeBtn;

    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.text = @"请输入支付密码";
    titleLab.textColor = lxy_Color_333333;
    titleLab.font = [UIFont systemFontOfSize:16];
    titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab = titleLab;
    
    UILabel *payTypeLab = [[UILabel alloc] init];
    payTypeLab.textColor = lxy_Color_333333;
    payTypeLab.font = [UIFont systemFontOfSize:16];
    payTypeLab.textAlignment = NSTextAlignmentCenter;
    self.payTypeLab = payTypeLab;
    
    UILabel *payMoneyLab = [[UILabel alloc] init];
    payMoneyLab.textColor = [UIColor blackColor];
    payMoneyLab.font = [UIFont boldSystemFontOfSize:26];
    payMoneyLab.textAlignment = NSTextAlignmentCenter;
    self.payMoneyLab = payMoneyLab;
    
    lxy_PayPasswordView *pwdView = [[lxy_PayPasswordView alloc] init];
    self.pwdView = pwdView;
    
    
    [self addSubview:titleLab];
    [self addSubview:payTypeLab];
    [self addSubview:payMoneyLab];
    [self addSubview:pwdView];
    [self addSubview:closeBtn];
    
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat closeWH = 25;
    CGFloat closeXY = 10;
    
    CGFloat labW = self.width;
    CGFloat labH = 35;
    CGFloat moneyLabH = 35;
    CGFloat moneyMargin = 5;
    CGFloat pwdMargin = 10;
    CGFloat pwdX = 30;
    CGFloat pwdH = 40;
    CGFloat pwdW = self.width -2*pwdX;
    
    CGFloat titleY = (self.height - 2*labH - moneyLabH - moneyMargin - pwdH - pwdMargin)*0.5;
    
    _closeBtn.frame = CGRectMake(closeXY, closeXY, closeWH, closeWH);
    _titleLab.frame = CGRectMake(0, titleY, labW, labH);
    _payTypeLab.frame = CGRectMake(0, _titleLab.bottom, labW, labH);
    CGFloat moneyY = _payTypeLab.bottom + moneyMargin;
    _payMoneyLab.frame = CGRectMake(0, moneyY, labW, moneyLabH);
    CGFloat pwdY = _payMoneyLab.bottom + pwdMargin;
    _pwdView.frame = CGRectMake(pwdX, pwdY, pwdW, pwdH);
    
    [self setupRadiu:8];
    

}

#pragma mark ---- set,get方法

-(void)setPwdArr:(NSArray *)pwdArr{
    _pwdArr = pwdArr;
    self.pwdView.pwdArr = pwdArr;
}

-(void)setDeletePwdArr:(NSArray *)deletePwdArr{
    _deletePwdArr = deletePwdArr;
    self.pwdView.deletePwdArr = deletePwdArr;
}

-(void)resetPasswordBoxColor{
    [self.pwdView resetPasswordBoxColor];
}

-(void)setPayTypeStr:(NSString *)payTypeStr{
    _payTypeStr = payTypeStr;
    _payTypeLab.text = payTypeStr;
    
}


-(void)setPayMoneyStr:(NSString *)payMoneyStr{
    _payMoneyStr = payMoneyStr;
    _payMoneyLab.text = [NSString stringWithFormat:@"¥ %@",payMoneyStr];
    
}



#pragma mark ---- 点击方法

-(void)closeBtnClick{
    if (self.closeBtnBlock) {
        self.closeBtnBlock();
    }
}

@end
