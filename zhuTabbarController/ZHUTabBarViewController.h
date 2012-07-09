//
//  ZHUTabBarViewController.h
//  zhuTabbarController
//
//  Created by zhukuanxi@gmail.com on 7/9/12.
//  Copyright (c) 2012 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHUTabBar.h"

@interface ZHUTabBarViewController : UITabBarController <ZHUTabBarDelegate, UITabBarControllerDelegate> {
    
}
@property (strong, nonatomic) ZHUTabBar *customTabBar;
- (void)hideTabbar:(BOOL)hide animated:(BOOL)animated;
- (void)setBadgeValueForController:(UIViewController *)ctl;
@end
