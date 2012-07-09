//
//  ZHUTabBtn.h
//  zhuTabbarController
//
//  Created by zhukuanxi@gmail.com on 7/9/12.
//  Copyright (c) 2012 tencent. All rights reserved.
//

@class ZHUBadgeView;
#import <UIKit/UIKit.h>

@interface ZHUTabBtn : UIButton

@property (nonatomic, strong) ZHUBadgeView *badgeView;
- (void)setBadgeString:(NSString *)badgeValue;
@end
