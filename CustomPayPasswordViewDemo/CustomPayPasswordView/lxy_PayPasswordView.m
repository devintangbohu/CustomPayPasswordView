//
//  lxy_PayPasswordView.m
//  CustomPayPasswordViewDemo
//
//  Created by Devin on 2021/3/12.
//  Copyright © 2021 tracy. All rights reserved.
//  6位支付密码视图

#import "lxy_PayPasswordView.h"
#import "lxy_PayPasswordItem.h"
#import "lxy_Define.h"
#import "UIView+lxyExtension.h"

@interface lxy_PayPasswordView()<UITextFieldDelegate>
/** 支付密码框个数 */
@property (nonatomic, assign) NSUInteger pwdCount;

@end

@implementation lxy_PayPasswordView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.pwdCount = 6;
        [self initPayPasswordUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame pwdCount:(NSUInteger)pwdCount{
    self = [super initWithFrame:frame];
    if (self) {
        self.pwdCount = pwdCount;
        [self initPayPasswordUI];
    }
    return self;
}


-(void)initPayPasswordUI{
    for (int i = 0; i<_pwdCount; i++) {
        lxy_PayPasswordItem *item = [[lxy_PayPasswordItem alloc] init];
        [self addSubview:item];
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    for (int i = 0; i<self.subviews.count; i++) {
        id subview = self.subviews[i];
        if ([subview isKindOfClass:[lxy_PayPasswordItem class]]) {
            CGFloat itemWH = self.width /_pwdCount;
            CGFloat itemX = i*itemWH;
            CGFloat itemY = self.height - itemWH;
            lxy_PayPasswordItem *pwdItem =(lxy_PayPasswordItem *)subview;
            pwdItem.frame = CGRectMake(itemX, itemY, itemWH, itemWH);
            pwdItem.layer.masksToBounds = YES;
            pwdItem.layer.cornerRadius = 0;
            pwdItem.layer.borderWidth = 0.5;
            pwdItem.layer.borderColor = lxy_LineColor.CGColor;
            
        }
    }
    
}


-(void)setPwdArr:(NSArray *)pwdArr{
    _pwdArr = pwdArr;
    
    int pwdCount = (int)pwdArr.count;
    
    for (int i = 0; i<pwdCount; i++) {
        if (self.subviews.count < i+1){ NSLog(@"==>> %@",@"item个数不足"); return;}
        id subview = self.subviews[i];
        lxy_PayPasswordItem *pwdItem =(lxy_PayPasswordItem *)subview;
        pwdItem.circleColor = [UIColor blackColor];
        pwdItem.isHidePassword = NO;
    }
    
   
}

-(void)setDeletePwdArr:(NSArray *)deletePwdArr{
    _deletePwdArr = deletePwdArr;

    int beginIndex = (int)self.pwdArr.count ;
    //密码后面开始，中间圆的颜色和背景色相同;
    [self setPasswordBoxcolorWithIndex:beginIndex];
    
}

-(void)resetPasswordBoxColor{
    //所有中间圆的颜色和背景色相同;
    [self setPasswordBoxcolorWithIndex:0];
}

-(void)setPasswordBoxcolorWithIndex:(int)index{
    //密码后面开始，中间圆的颜色和背景色相同;
    for (int i = index; i<self.subviews.count; i++) {
        id subview = self.subviews[i];
        lxy_PayPasswordItem *pwdItem =(lxy_PayPasswordItem *)subview;
        pwdItem.circleColor = [UIColor whiteColor];
        pwdItem.isHidePassword = NO;
    }
}

@end
