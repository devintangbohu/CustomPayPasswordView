//
//  ViewController.m
//  CustomPayPasswordViewDemo
//
//  Created by Devin on 2021/3/20.
//

#import "ViewController.h"
#import "lxy_CustomPayPasswordView.h"

@interface ViewController ()
/** 支付密码 */
@property (nonatomic, strong) lxy_CustomPayPasswordView *pwdView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
}


-(void)test{
    UIButton *payBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 80, 50)];
    [payBtn setTitle:@"余额支付" forState:UIControlStateNormal];
    [payBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    payBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [payBtn addTarget:self action:@selector(payBtnClick) forControlEvents:UIControlEventTouchUpInside];
    payBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:payBtn];
}


-(void)payBtnClick{
    [self.pwdView show];
    
}

-(void)requestPayResultWithPayPassword:(NSString *)payPassword{
    
    if ([payPassword isEqualToString:@"123456"]) {
        NSLog(@"支付成功！");
        [_pwdView hidden];
    }else{
        NSLog(@"支付失败！");
    }
    
}

/** 懒加载 */
-(lxy_CustomPayPasswordView *)pwdView{
    if (!_pwdView) {
        __weak typeof(self) weakSelf = self;
        _pwdView = [[lxy_CustomPayPasswordView alloc] init];
        _pwdView.payTypeStr = @"余额支付";
        _pwdView.payMoneyStr = @"2300.80";
        _pwdView.completeBlock = ^(NSString * _Nonnull payPassword) {
            NSLog(@"支付密码: ==>> %@",payPassword);
            [weakSelf requestPayResultWithPayPassword:payPassword];
            
        };
    }
    return _pwdView;
}


@end
