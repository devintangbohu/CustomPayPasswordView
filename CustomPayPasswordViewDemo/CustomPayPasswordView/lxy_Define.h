//
//  lxy_Define.h
//  lxy_titlePageViewDemo
//
//  Created by Devin on 2021/1/18.
//

#ifndef lxy_Define_h
#define lxy_Define_h

///屏幕宽高
#define lxy_ScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define lxy_ScreenHeight ([UIScreen mainScreen].bounds.size.height)

/// block self
#define lxy_SelfWeak __weak typeof(self) weakSelf = self
#define lxy_SelfStrong __strong __typeof__(self) strongSelf = weakSelf

/// 设置颜色 示例：UIColorHex(0x26A7E8)
#define UIColorHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define lxy_Color_999999  UIColorHex(0x999999)
#define lxy_Color_333333  UIColorHex(0x333333)
#define lxy_LineColor     UIColorHex(0xe0e0e0)

///iphone 适配
#define lxy_IsIPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define lxy_IsIPhoneX lxy_ScreenWidth >=375.0f && lxy_ScreenHeight >=812.0f&& lxy_IsIPhone

/*导航栏高度*/
#define lxy_NavBarHeight (44)
/*状态栏和导航栏总高度*/
#define lxy_NavHeight (CGFloat)(lxy_IsIPhoneX ? (88.0):(64.0))
/*TabBar高度*/
#define lxy_TabBarHeight (CGFloat)(lxy_IsIPhoneX ? (49.0 + 34.0):(49.0))


#endif /* lxy_Define_h */
