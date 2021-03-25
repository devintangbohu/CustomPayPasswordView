//
//  lxy_PayPasswordKeyboard.m
//  CustomPayPasswordViewDemo
//
//  Created by Devin on 2021/3/12.
//  Copyright © 2021 tracy. All rights reserved.
//

#import "lxy_PayPasswordKeyboard.h"
#import "lxy_Define.h"
#import "UIView+lxyExtension.h"

@interface lxy_PayPasswordKeyboard()

/** 键盘数据 */
@property (nonatomic, strong) NSArray<NSString *> *keyboardArr;
/** 用来装数字的数组 */
@property (nonatomic, strong) NSMutableArray *numArr;

@end

@implementation lxy_PayPasswordKeyboard

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = lxy_LineColor;
        [self initPasswordKeyboardUI];
    }
    return self;
}
-(void)initPasswordKeyboardUI{
    NSUInteger count = self.keyboardArr.count;
    for (int i = 0; i<count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:_keyboardArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:20];
        [btn addTarget:self action:@selector(keyboardClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImage *whiteImage = [UIImage imageNamed:@"CustomPayPasswordViewDemo.bundle/passwordBg_white.png"];
        UIImage *grayImage = [UIImage imageNamed:@"CustomPayPasswordViewDemo.bundle/passwordBg_gray.png"];
        UIImage *backgroundImage = [UIImage imageNamed:@"CustomPayPasswordViewDemo.bundle/passwordBg.png"];
        UIImage *deleteImage = [UIImage imageNamed:@"CustomPayPasswordViewDemo.bundle/delete.png"];
        
        [btn setBackgroundImage:whiteImage forState:UIControlStateNormal];
        [btn setBackgroundImage:grayImage forState:UIControlStateHighlighted];
        [self addSubview:btn];
        
        if (i == count - 3 ) { //左边底下空白键。
            [btn setBackgroundImage:backgroundImage forState:UIControlStateNormal];
            [btn setBackgroundImage:grayImage forState:UIControlStateHighlighted];
            btn.userInteractionEnabled = NO;
        }else if (i == count - 1){//删除键
            [btn setBackgroundImage:backgroundImage forState:UIControlStateNormal];
            [btn setBackgroundImage:grayImage forState:UIControlStateHighlighted];
            [btn setImage:deleteImage forState:UIControlStateNormal];
        }
    }
    
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSUInteger itemCount = self.keyboardArr.count;
    NSUInteger lineCount = 3;
    CGFloat margin  = 1;
    CGFloat columnCount = (itemCount - 1)/lineCount + 1;
    CGFloat btnW = (self.width - (lineCount - 1)*margin)/lineCount;
    CGFloat btnH = (self.height - (columnCount - 1)*margin)/columnCount;
    
    for (int i = 0; i<itemCount; i++) {
        id subview = self.subviews[i];
        if ([subview isKindOfClass:[UIButton class]]) {
            CGFloat btnX = (i%lineCount)*(btnW+margin);
            CGFloat btnY = (i/lineCount)*(btnH+margin);
            UIButton *btn = (UIButton *)subview;
            btn.frame =CGRectMake(btnX, btnY, btnW, btnH);
        }
    }
 
    
}

#pragma mark ---- 点击事件
-(void)keyboardClick:(UIButton *)btn{
    
    UIButton *lastBtn = [self.subviews lastObject];
    if (lastBtn == btn) {//删除按钮点击
        if (self.numArr.count > 0) {
            [self.numArr removeLastObject];
            if (self.deleteBtnBlock) {
                self.deleteBtnBlock(self.numArr);
            }
        }
    }else{ //数字按钮点击（空白按钮已经不让用户交互了）
        NSString *btnStr = btn.titleLabel.text;
        [self.numArr addObject:btnStr];
        
        if (self.numArr.count == 6){//密码输入完成
            if (self.completeBlock) {
                self.completeBlock(self.numArr);
            }
        }else if (self.numArr.count > 6){//密码输入大于6位，删除最后一位
            [self.numArr removeLastObject];
            if (self.numberBtnBlock) {
                self.numberBtnBlock(self.numArr);
            }
        }else{
            if (self.numberBtnBlock) {
                self.numberBtnBlock(self.numArr);
            }
        }
    }
}

-(void)clearKeyboardData{
    [self.numArr removeAllObjects];
}

#pragma mark ---- 懒加载

/** 懒加载 */
-(NSArray *)keyboardArr{
    if (!_keyboardArr) {
        _keyboardArr = @[@"1", @"2",@"3", @"4",@"5", @"6",@"7", @"8",@"9", @"", @"0",@""];
    }
    return _keyboardArr;
}

/** 懒加载 */
-(NSMutableArray *)numArr{
    if (!_numArr) {
        _numArr = [NSMutableArray array];
    }
    return _numArr;
}


@end
