//
//  ZHUTabBar.h
//  zhuTabbarController
//
//  Created by zhukuanxi@gmail.com on 7/9/12.
//  Copyright (c) 2012 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ZHUTabBarDelegate;

@interface ZHUTabBar : UIView 
@property (strong, nonatomic) NSArray *tabItems;
@property (assign, nonatomic) NSInteger selectIndex;
@property (strong, nonatomic) UIImageView *indicatorView;
@property (weak, nonatomic) id<ZHUTabBarDelegate> delegate;
- (id)initWithFrame:(CGRect)frame tabItems:(NSArray *)items;
- (void)moveIndicatorToIndex:(NSInteger)index animated:(BOOL)animated;
- (void)setBadgeValue:(NSString *)badgeValue atIndex:(NSInteger)index;
@end

@protocol ZHUTabBarDelegate <NSObject>
@optional
- (void)tabBar:(ZHUTabBar *)tabBar didSelectIndex:(NSInteger)index;
@end