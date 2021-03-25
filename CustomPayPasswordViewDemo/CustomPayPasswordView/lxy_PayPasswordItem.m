//
//  lxy_PayPasswordItem.m
//  CustomPayPasswordViewDemo
//
//  Created by Devin on 2021/3/12.
//  Copyright © 2021 tracy. All rights reserved.
//

#import "lxy_PayPasswordItem.h"
#import "lxy_Define.h"
#import "UIView+lxyExtension.h"

@implementation lxy_PayPasswordItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _isHidePassword = YES;
        _circleColor = [UIColor blackColor];
        self.backgroundColor = [UIColor whiteColor];
        _circleSize = CGSizeMake(15,15);
    }
    return self;
}


-(void)drawRect:(CGRect)rect {
    
    if (!_isHidePassword) {
        // 获取图形上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGFloat width = rect.size.width;
        CGFloat height = rect.size.height;
        CGFloat circleW = _circleSize.width;
        CGFloat circleH = _circleSize.height;
        CGFloat circleX = (width - circleW)/2;
        CGFloat circleY = (height - circleH)/2;
        
        
        //画实心圆
        CGRect frame = CGRectMake(circleX, circleY, circleW, circleH);
        //填充当前绘画区域内的颜色
        [self.backgroundColor set];
        //填充当前矩形区域
        CGContextFillRect(ctx, rect);
        //以矩形frame为依据画一个圆
        CGContextAddEllipseInRect(ctx, frame);
        //填充当前绘画区域内的颜色
        [_circleColor set];
        //填充(沿着矩形内围填充出指定大小的圆)
        CGContextFillPath(ctx);
    }
   
}

-(void)setIsHidePassword:(BOOL)isHidePassword{
    _isHidePassword = isHidePassword;
    
    //调用setNeedsDisplay方法，则程序会自动调用drawRect方法进行重绘
    [self setNeedsDisplay];
}

@end
